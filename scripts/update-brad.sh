#!/usr/bin/env bash
# update-brad.sh — Atualiza o Brad Frost Design System Agent para a última versão
# Uso: bash scripts/update-brad.sh [destino]
# Exemplo: bash scripts/update-brad.sh ./meu-projeto/.claude/agents/brad-frost

set -euo pipefail

REPO="Redpine-Internal/design-system-5.0"
BRANCH="main"
# Detectar destino: aios-core/squads/ se existir, senão .brad-frost/
if [ -n "${1:-}" ]; then
  DEST="$1"
elif [ -d "aios-core/squads" ]; then
  DEST="aios-core/squads/brad-frost"
else
  DEST=".brad-frost"
fi

# Cores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  Brad Frost DS Agent — Updater${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

# Verificar gh CLI
if ! command -v gh &> /dev/null; then
  echo "Erro: gh CLI não encontrado. Instale com: brew install gh"
  exit 1
fi

# Verificar autenticação
if ! gh auth status &> /dev/null 2>&1; then
  echo "Erro: gh não autenticado. Execute: gh auth login"
  exit 1
fi

# Buscar versão remota
echo -e "\n${YELLOW}Verificando versão remota...${NC}"
REMOTE_VERSION=$(gh api "repos/$REPO/contents/config.yaml?ref=$BRANCH" \
  --jq '.content' | base64 -d | grep '^version:' | awk '{print $2}')
echo -e "  Remota: ${GREEN}v${REMOTE_VERSION}${NC}"

# Verificar versão local (se existir)
if [ -f "$DEST/config.yaml" ]; then
  LOCAL_VERSION=$(grep '^version:' "$DEST/config.yaml" | awk '{print $2}')
  echo -e "  Local:  v${LOCAL_VERSION}"

  if [ "$LOCAL_VERSION" = "$REMOTE_VERSION" ]; then
    echo -e "\n${GREEN}Já está na última versão (v${LOCAL_VERSION}).${NC}"
    exit 0
  fi
  echo -e "\n${YELLOW}Atualizando v${LOCAL_VERSION} → v${REMOTE_VERSION}...${NC}"
else
  echo -e "  Local:  (não instalado)"
  echo -e "\n${YELLOW}Instalando v${REMOTE_VERSION}...${NC}"
fi

# Criar diretório destino
mkdir -p "$DEST"

# Baixar via gh api (tarball)
TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT

echo -e "${YELLOW}Baixando arquivos...${NC}"
gh api "repos/$REPO/tarball/$BRANCH" > "$TMPDIR/repo.tar.gz"

# Extrair
cd "$TMPDIR"
tar xzf repo.tar.gz
EXTRACTED=$(ls -d Redpine-Internal-design-system-5.0-* 2>/dev/null || ls -d */ | head -1)

# Copiar apenas as pastas do agent (excluir .git, scripts, outputs, etc.)
cd - > /dev/null
rsync -a --delete \
  --exclude='.git/' \
  --exclude='.gitignore' \
  --exclude='scripts/' \
  --exclude='outputs/' \
  --exclude='Design-System-*.zip' \
  "$TMPDIR/$EXTRACTED/" "$DEST/"

# Contar arquivos
TOTAL=$(find "$DEST" -type f | wc -l | tr -d ' ')

echo -e "\n${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  Atualizado para v${REMOTE_VERSION}${NC}"
echo -e "${GREEN}  ${TOTAL} arquivos em ${DEST}/${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "Para ativar: @design-system"
