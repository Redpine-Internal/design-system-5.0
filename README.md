# Synkra AIOS - Framework Universal de Agentes IA para Desenvolvimento Full Stack

[![Licenca: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Node.js](https://img.shields.io/badge/node-%3E%3D18.0.0-brightgreen.svg)](https://nodejs.org/)
[![NPM](https://img.shields.io/npm/v/aios-core.svg)](https://www.npmjs.com/package/aios-core)

O **Synkra AIOS** (AI-Orchestrated System) e um meta-framework que orquestra agentes de IA especializados para desenvolvimento de software completo — do planejamento ao deploy. Combina duas inovacoes: **Desenvolvimento Agil Dirigido por Agentes** e **Clonagem de Mentes Especialistas** (Squad Creator).

---

## Indice

- [O Que Faz](#o-que-faz)
- [Beneficios](#beneficios)
- [Arquitetura](#arquitetura)
- [Pre-requisitos](#pre-requisitos)
- [Instalacao](#instalacao)
- [Inicio Rapido](#inicio-rapido)
- [Sistema de Agentes](#sistema-de-agentes)
- [Comandos por Agente](#comandos-por-agente)
- [Workflows Principais](#workflows-principais)
- [Squad Creator — Clonagem de Mentes](#squad-creator--clonagem-de-mentes)
- [Estrutura de Diretorios](#estrutura-de-diretorios)
- [Principios Constitucionais](#principios-constitucionais)
- [IDEs Compatíveis](#ides-compativeis)
- [Configuracao](#configuracao)
- [Contribuicao](#contribuicao)
- [Licenca](#licenca)

---

## O Que Faz

O Synkra AIOS transforma o desenvolvimento de software em um processo orquestrado por agentes de IA, cada um com persona, autoridade e escopo definidos.

### Inovacao 1: Planejamento Agentico

Agentes dedicados (`@analyst`, `@pm`, `@architect`) colaboram para criar documentos de PRD e Arquitetura detalhados. Atraves de engenharia avancada de prompts e refinamento human-in-the-loop, produzem especificacoes que vao alem da geracao generica de tarefas.

### Inovacao 2: Desenvolvimento Contextualizado

O agente `@sm` (Scrum Master) transforma planos em historias de desenvolvimento hiperdetalhadas contendo tudo que o `@dev` precisa — contexto completo, detalhes de implementacao e orientacao arquitetural incorporada diretamente nos arquivos de historia.

### Inovacao 3: Clonagem de Mentes (Squad Creator)

Sistema para criar squads de agentes IA baseados em **mentes reais** — autores, especialistas e profissionais com frameworks documentados. Extrai Voice DNA (vocabulario, tom, historias) e Thinking DNA (frameworks, heuristicas, decisoes) para gerar agentes com 85-97% de fidelidade ao especialista original.

**Resultado:** Elimina inconsistencia de planejamento e perda de contexto — os dois maiores problemas no desenvolvimento assistido por IA.

---

## Beneficios

| Beneficio | Descricao |
|-----------|-----------|
| **Equipe IA completa** | 12 agentes especializados (dev, qa, architect, pm, po, sm, analyst, devops, data-engineer, ux-expert, squad-creator, aios-master) |
| **Qualidade garantida** | Quality gates automaticos em cada fase — lint, typecheck, testes, CodeRabbit |
| **Separacao de autoridade** | Cada agente tem escopo exclusivo. So `@devops` faz push. So `@architect` decide arquitetura |
| **Story-driven** | Todo codigo comeca com uma historia validada com acceptance criteria claros |
| **Expertise sob demanda** | Clone mentes de especialistas reais (60+ ja clonados) para qualquer dominio |
| **Multi-IDE** | Funciona com Claude Code, Cursor, Gemini CLI e VS Code |
| **Zero invencao** | Specs derivam de requisitos, nunca inventam features |
| **Cost-efficient** | Worker scripts em Python para operacoes deterministicas (zero custo LLM) |
| **Escalavel** | 31+ squads, 206+ agentes, 100.000+ linhas de codigo geradas em producao |

---

## Arquitetura

### Hierarquia CLI First

```
CLI (Maxima) → Observability (Secundaria) → UI (Terciaria)
```

- A CLI e a fonte da verdade — dashboards apenas observam
- Funcionalidades novas devem funcionar 100% via CLI antes de ter UI
- A UI nunca e requisito para operacao do sistema

### Fluxo de Desenvolvimento

```
[PRD + Arquitetura]
        |
   @sm (Fragmenta em Stories)
        |
   @po (Valida — checklist 10 pontos)
        |
   @dev (Implementa)
        |
   @qa (Quality Gate — 7 verificacoes)
        |
   @devops (Push — autoridade exclusiva)
        |
   GitHub
```

### Fluxo de Criacao de Squads

```
Usuario: "Preciso de um squad para {dominio}"
        |
   @squad-chief (Pesquisa mentes de elite)
        |
   @oalanicolas (Extrai Voice DNA + Thinking DNA)
        |
   @pedro-valerio (Valida processo)
        |
   Gera Agentes + Smoke Tests (3 obrigatorios)
        |
   Squad Pronto
```

---

## Pre-requisitos

- **Node.js** >= 18.0.0 (v20+ recomendado)
- **npm** >= 9.0.0
- **Git**
- **GitHub CLI** (opcional, para colaboracao em equipe)

---

## Instalacao

### Opcao 1: Instalador NPX (Recomendado)

```bash
npx @synkra/aios-core@latest install
```

O wizard interativo vai perguntar:
- Quais squads instalar (hybrid-ops, expansion-creator, etc.)
- Quais IDEs configurar (Claude Code, Cursor, Gemini)
- Preferencias de sharding (single vs multi-file)

### Opcao 2: Clone do Repositorio

```bash
git clone https://github.com/SynkraAI/aios-core.git
cd aios-core
npm install
```

### Opcao 3: Submodulo Git

```bash
git submodule add https://github.com/SynkraAI/aios-core.git aios-core
```

### Atualizacao

```bash
npx github:SynkraAI/aios-core install
```

Detecta automaticamente a instalacao existente e atualiza apenas arquivos modificados (com backup `.bak`).

---

## Inicio Rapido

### 1. Ativar um agente

```
@dev
*help
```

### 2. Criar uma historia

```
@sm
*create-story
```

### 3. Implementar

```
@dev
*develop "Story 1.1"
```

### 4. Validar qualidade

```
@qa
*qa-gate "Story 1.1"
```

### 5. Fazer push

```
@devops
*pre-push
```

---

## Sistema de Agentes

### Agentes AIOS Core (12)

| Agente | Persona | Funcao | Autoridade Exclusiva |
|--------|---------|--------|----------------------|
| `@aios-master` | — | Meta-orquestrador, governanca do framework | Override de qualquer agente |
| `@dev` | Dex | Implementacao de codigo | git add, git commit (local) |
| `@qa` | Quinn | Testes e qualidade | Vereditos de qualidade |
| `@architect` | Aria | Arquitetura e design tecnico | Decisoes arquiteturais |
| `@pm` | Morgan | Product Management, epics | Epics, PRD |
| `@po` | Pax | Product Owner, backlog | Validacao de stories |
| `@sm` | River | Scrum Master, stories | Criacao de stories |
| `@analyst` | Alex | Pesquisa e analise de negocios | — |
| `@devops` | Gage | CI/CD, git push, PRs, releases | **git push, PR, release, MCP** |
| `@data-engineer` | Dara | Database design, schema, migrations | Schema DDL |
| `@ux-design-expert` | Uma | UX/UI design | — |
| `@squad-creator` | — | Criacao e gestao de squads | — |

### Agentes Squad Creator (3)

| Agente | Funcao |
|--------|--------|
| `@squad-chief` | Orquestrador, triagem, roteamento, extracao de SOP |
| `@oalanicolas` | Clonagem de mentes (46 checkpoints de decisao) |
| `@pedro-valerio` | Design de processos (condicoes de veto) |

### Ativacao

```
@nome-do-agente     # Ativa o agente
*help               # Lista comandos disponiveis
*exit               # Sai do modo agente
```

---

## Comandos por Agente

### @dev (Implementacao)

| Comando | Descricao |
|---------|-----------|
| `*develop` | Implementar historia (modo interativo) |
| `*develop-yolo` | Modo autonomo (0-1 prompts) |
| `*develop-preflight` | Modo plan-first (10-30 prompts) |
| `*update-story` | Atualizar progresso da historia |
| `*complete-task` | Marcar tarefa como completa |

### @qa (Qualidade)

| Comando | Descricao |
|---------|-----------|
| `*qa-gate` | Executar quality gate (7 verificacoes) |
| `*validate-story` | Validar implementacao |
| `*qa-loop {storyId}` | Ciclo iterativo review-fix (max 5) |
| `*stop-qa-loop` | Pausar e salvar estado |
| `*escalate-qa-loop` | Forcar escalacao manual |

### @sm (Scrum Master)

| Comando | Descricao |
|---------|-----------|
| `*draft` / `*create-story` | Criar historias a partir do PRD |
| `*fragment-prd` | Fragmentar PRD inteiro em historias |
| `*split-story` | Dividir historia grande |

### @po (Product Owner)

| Comando | Descricao |
|---------|-----------|
| `*validate-story-draft` | Validacao com checklist de 10 pontos |
| `*prioritize-backlog` | Priorizar historias no backlog |

### @pm (Product Manager)

| Comando | Descricao |
|---------|-----------|
| `*create-epic` | Criar epic |
| `*execute-epic` | Executar epic |

### @devops (Infraestrutura)

| Comando | Descricao |
|---------|-----------|
| `*pre-push` | Quality gates + git push |
| `*create-pr` | Criar Pull Request |
| `*detect-repo` | Informacoes do repositorio |
| `*search-mcp` | Buscar no catalogo MCP |
| `*add-mcp` | Adicionar servidor MCP |
| `*list-mcps` | Listar MCPs habilitados |

### @architect (Arquitetura)

| Comando | Descricao |
|---------|-----------|
| Decisoes de arquitetura | Design de sistema |
| Selecao de tecnologia | Avaliacao de stack |
| Avaliacao de complexidade | Dimensionamento |

### @squad-creator (Squads)

| Comando | Descricao |
|---------|-----------|
| `*create-squad` | Criacao completa de squad |
| `*clone-mind {nome}` | Clonar especialista especifico |
| `*validate-squad {nome}` | Validar squad (9 fases) |
| `*extract-sop` | Extrair SOP de transcricao |
| `*discover-tools {dominio}` | Descoberta profunda de ferramentas |
| `*refresh-registry` | Atualizar registro de squads |
| `*quality-dashboard` | Exibir metricas |

---

## Workflows Principais

### 1. Story Development Cycle (SDC)

O workflow primario para todo desenvolvimento:

| Fase | Agente | Task | Saida |
|------|--------|------|-------|
| 1. Criar | @sm | `create-next-story.md` | Historia criada (Draft) |
| 2. Validar | @po | `validate-next-story.md` | GO/NO-GO (checklist 10 pontos) |
| 3. Implementar | @dev | `dev-develop-story.md` | Codigo implementado |
| 4. QA Gate | @qa | `qa-gate.md` | PASS/CONCERNS/FAIL/WAIVED |

### 2. QA Loop (Review Iterativo)

```
@qa review → veredito → @dev corrige → re-review (max 5 iteracoes)
```

Vereditos: `APPROVE` (concluir) | `REJECT` (corrigir) | `BLOCKED` (escalar)

### 3. Spec Pipeline (Pre-implementacao)

Transforma requisitos informais em especificacao executavel:

| Fase | Agente | Saida |
|------|--------|-------|
| 1. Coletar | @pm | `requirements.json` |
| 2. Avaliar | @architect | `complexity.json` |
| 3. Pesquisar | @analyst | `research.json` |
| 4. Escrever Spec | @pm | `spec.md` |
| 5. Criticar | @qa | `critique.json` |
| 6. Planejar | @architect | `implementation.yaml` |

### 4. Brownfield Discovery (Avaliacao de Legado)

Avaliacao tecnica de debito tecnico em 10 fases para codebases existentes.

---

## Squad Creator — Clonagem de Mentes

O Squad Creator permite criar equipes de agentes IA baseados em especialistas reais.

### Como Funciona

1. **Coleta de fontes** — Livros, transcricoes, artigos, videos, posts em redes sociais
2. **Extracao de Voice DNA** — Vocabulario, tom, expressoes, historias do especialista
3. **Extracao de Thinking DNA** — Frameworks mentais, heuristicas, padroes de decisao
4. **Geracao de agentes** — Agente IA com 85-97% de fidelidade ao original
5. **Smoke tests** — 3 testes obrigatorios (conhecimento, decisao, objecoes)
6. **Validacao** — 9 fases de validacao de qualidade

### Estatisticas de Producao

| Metrica | Valor |
|---------|-------|
| Squads criados | 31+ |
| Agentes deployados | 206+ |
| Mentes clonadas | 60+ |
| Linhas de codigo | 100.000+ |
| Maior squad | `copy` (25 copywriters, 32.049 linhas) |

### Exemplo: Criar um Squad

```
@squad-creator
*create-squad

# Ou clonar uma mente especifica
*clone-mind "Alex Hormozi"
```

### Fontes Suportadas

- Livros (PDF, EPUB)
- Transcricoes (reunioes, podcasts)
- Artigos (web, markdown)
- Videos (transcricoes do YouTube)
- Redes sociais (Twitter, LinkedIn)

---

## Estrutura de Diretorios

```
melhoriadosystemdesign/
├── .aios-core/                    # Core do Framework (v4.31.1)
│   ├── constitution.md            # Principios inegociaveis
│   ├── user-guide.md              # Manual completo (1.410 linhas)
│   ├── core-config.yaml           # Configuracao do framework
│   ├── development/
│   │   ├── agents/                # 12 agentes (dev, qa, architect, etc.)
│   │   ├── tasks/                 # 45+ tasks executaveis
│   │   ├── templates/             # Templates de documentos e codigo
│   │   ├── checklists/            # Gates de validacao
│   │   └── scripts/               # Scripts de automacao
│   ├── core/                      # Modulos principais
│   ├── data/                      # Knowledge bases
│   ├── product/                   # Gestao de produto
│   └── infrastructure/            # CI/CD, integracoes
│
├── squad/                         # Squad Creator Expansion (v3.0.0)
│   ├── agents/                    # 3 agentes especializados
│   ├── tasks/                     # 30+ tasks de criacao de squads
│   ├── workflows/                 # 11 workflows multi-fase
│   ├── minds/                     # Mentes clonadas
│   ├── data/                      # Registro de ferramentas, frameworks
│   ├── templates/                 # Templates de squad
│   ├── checklists/                # Quality gates
│   └── scripts/                   # Workers Python (zero custo LLM)
│
├── outputs/                       # Artefatos gerados
│   └── minds/                     # DNAs extraidos
│
├── docs/                          # Documentacao
│   └── research/                  # Saidas de pesquisa
│
├── .claude/                       # Integracao Claude Code
│   ├── rules/                     # Regras do projeto
│   └── commands/                  # Comandos de agentes
│
├── aios-core/                     # Core legado (sendo migrado)
├── thoughts/                      # Design thinking
└── AGENTS.md                      # Regras de ativacao de agentes
```

---

## Principios Constitucionais

O Synkra AIOS possui uma **Constitution formal** com principios inegociaveis:

| Artigo | Principio | Severidade | Descricao |
|--------|-----------|------------|-----------|
| I | **CLI First** | NON-NEGOTIABLE | Toda funcionalidade deve funcionar 100% via CLI antes de UI |
| II | **Agent Authority** | NON-NEGOTIABLE | Cada agente tem autoridades exclusivas que nao podem ser violadas |
| III | **Story-Driven** | MUST | Todo desenvolvimento comeca e termina com uma historia |
| IV | **No Invention** | MUST | Especificacoes derivam de requisitos, nunca inventam |
| V | **Quality First** | MUST | lint, typecheck, testes — tudo deve passar |
| VI | **Absolute Imports** | SHOULD | Sempre `@/` ao inves de `../../../` |

Violacoes de principios NON-NEGOTIABLE sao **bloqueadas automaticamente** por gates.

---

## IDEs Compativeis

| IDE | Ativacao | Formato |
|-----|----------|---------|
| **Claude Code** | `@agent-name` | `.claude/commands/` |
| **Cursor** | `@agent-name` | `.cursor/rules/` |
| **Gemini CLI** | `/agent-name` | `.gemini/` |
| **VS Code** | Via extensoes | `.vscode/` |
| **Codex CLI** | `/agent-name` | `.codex/` |

---

## Configuracao

### Variaveis de Ambiente

```bash
# .env
ANTHROPIC_API_KEY=       # API Anthropic (Claude)
OPENAI_API_KEY=          # API OpenAI (opcional)
OPENROUTER_API_KEY=      # Multi-model routing (opcional)
DEEPSEEK_API_KEY=        # Modo claude-free (opcional)
```

### Arquivos de Configuracao

| Arquivo | Funcao |
|---------|--------|
| `.aios-core/core-config.yaml` | Configuracao do framework |
| `.aios-core/constitution.md` | Principios fundamentais |
| `squad/config.yaml` | Configuracao do Squad Creator |
| `.claude/CLAUDE.md` | Regras para Claude Code |
| `AGENTS.md` | Regras de ativacao para Codex CLI |

### Comandos Uteis

```bash
# Desenvolvimento
npm run dev              # Iniciar desenvolvimento
npm test                 # Rodar testes
npm run lint             # Verificar estilo
npm run typecheck        # Verificar tipos
npm run build            # Build producao

# Validacao
npm run validate:structure    # Validar estrutura
npm run validate:agents       # Validar agentes

# Sincronizacao
npm run sync:ide              # Sincronizar com IDEs
npm run sync:skills:codex     # Sincronizar skills

# Diagnostico
npx aios-core doctor          # Diagnostico do sistema
npx aios-core info            # Informacoes do sistema
```

### Debug

```bash
export AIOS_DEBUG=true
tail -f .aios/logs/agent.log
```

---

## Modos de Desenvolvimento

O `@dev` suporta tres modos de implementacao:

| Modo | Prompts | Controle | Uso |
|------|---------|----------|-----|
| **Interactive** (padrao) | 5-10 | Colaborativo | Aprendizado, tarefas complexas |
| **YOLO** | 0-1 | Autonomo | Tarefas simples, devs experientes |
| **Pre-Flight** | 10-30 upfront | Maximo | Features criticas, requisitos ambiguos |

```
@dev
*develop "Story 1.1"           # Interactive (padrao)
*develop-yolo "Story 1.1"     # Autonomo
*develop-preflight "Story 1.1" # Plan-first
```

---

## Quality Gates

### Pre-Push (Obrigatorio)

Antes de qualquer push, todos os checks devem passar:

```bash
npm run lint        # ESLint
npm run typecheck   # TypeScript
npm test            # Jest
npm run build       # Build
```

### QA Gate (7 Verificacoes)

1. Code review — padroes, legibilidade, manutenibilidade
2. Testes unitarios — cobertura adequada, todos passando
3. Acceptance criteria — todos atendidos conforme a historia
4. Sem regressoes — funcionalidade existente preservada
5. Performance — dentro de limites aceitaveis
6. Seguranca — OWASP basics verificados
7. Documentacao — atualizada se necessario

### Vereditos

| Veredito | Significado |
|----------|-------------|
| **PASS** | Todos os checks OK |
| **CONCERNS** | Aprovado com observacoes |
| **FAIL** | Issues HIGH/CRITICAL, retorna para @dev |
| **WAIVED** | Issues aceitos com waiver documentado |

---

## Contribuicao

1. Fork o repositorio
2. Crie uma branch (`feat/minha-feature`)
3. Siga os padroes de commit convencional (`feat:`, `fix:`, `docs:`, `chore:`)
4. Garanta que lint, typecheck e testes passam
5. Crie um Pull Request

### Convencoes de Commit

```
feat: nova funcionalidade [Story X.Y]
fix: correcao de bug [Story X.Y]
docs: atualizacao de documentacao
chore: manutencao
refactor: refatoracao
test: testes
```

---

## Licenca

MIT - Veja [LICENSE](LICENSE) para detalhes.

---

## Links

- **Repositorio:** [github.com/SynkraAI/aios-core](https://github.com/SynkraAI/aios-core)
- **NPM:** [@synkra/aios-core](https://www.npmjs.com/package/aios-core)
- **Comunidade Discord:** [discord.gg/gk8jAdXWmj](https://discord.gg/gk8jAdXWmj)
- **Documentacao:** [synkra.ai](https://synkra.ai)

---

*Synkra AIOS — CLI First | Agent-Driven | Quality First*
