# Projeto Z RP — Scripts

Coleção de scripts e recursos usados no **Projeto Z RP**, servidor de FiveM com temática de sobrevivência em um cenário pós-apocalíptico. Este repositório reúne recursos desenvolvidos por mim (@victorfelixdev) para o projeto e dependências de terceiros que faziam parte da base.

> Os recursos em `[pz]` são os scripts próprios do Projeto Z incluídos neste repositório. `[ox]` contém recursos do ecossistema Overextended e deve ser tratado como código de terceiros; consulte os respectivos arquivos `LICENSE` e `README.md` antes de reutilizar ou redistribuir.

## Índice

- [Sobre o Projeto Z RP](#sobre-o-projeto-z-rp)
- [Estrutura e índice dos scripts](#estrutura-e-índice-dos-scripts)
  - [`[pz]` — recursos do Projeto Z](#pz--recursos-do-projeto-z)
  - [`[ox]` — dependências de terceiros](#ox--dependências-de-terceiros)
- [Instalação e uso](#instalação-e-uso)
- [Créditos e licenças](#créditos-e-licenças)

## Sobre o Projeto Z RP

O Projeto Z RP foi um servidor multiplayer de **FiveM (GTA V)** centrado em sobrevivência durante um apocalipse zumbi. A proposta combinava roleplay com sistemas próprios de exploração, combate, recursos e interação em um mundo hostil. Relatos públicos dos desenvolvedores descrevem mais de 100 sistemas e mecânicas customizadas e uma comunidade que ultrapassou 25 mil participantes ao longo da trajetória do projeto. [1][2]

## Estrutura e índice dos scripts

### `[pz]` — recursos do Projeto Z

| Recurso | Resumo |
|---|---|
| [`deathnotes`](./[pz]/deathnotes) | Registro de mortes e informações associadas ao evento de morte. |
| [`pz_clothing`](./[pz]/pz_clothing) | Interface e lógica de roupas/vestuário. |
| [`pz_crafting`](./[pz]/pz_crafting) | Recurso de criação (crafting). |
| [`pz_gov`](./[pz]/pz_gov) | Sistemas relacionados ao governo e serviços públicos do servidor. |
| [`pz_heli`](./[pz]/pz_heli) | Lógica de cliente e servidor para helicópteros. |
| [`pz_infection`](./[pz]/pz_infection) | Mecânicas e interface relacionadas à infecção, com áudio próprio do recurso. |
| [`pz_logs`](./[pz]/pz_logs) | Registro de eventos do servidor. |
| [`pz_loot`](./[pz]/pz_loot) | Busca e distribuição de loot, incluindo áudio do recurso. |
| [`pz_map`](./[pz]/pz_map) | Mapa e interface associada. |
| [`pz_onlypeds`](./[pz]/pz_onlypeds) | Ajustes de população e pedestres. |
| [`pz_playground`](./[pz]/pz_playground) | Conjunto de ferramentas e mecânicas experimentais/utilitárias. |
| [`pz_presence`](./[pz]/pz_presence) | Presença e integração de status do jogador. |
| [`pz_radioactive`](./[pz]/pz_radioactive) | Zonas e efeitos de radiação. |
| [`pz_scripts`](./[pz]/pz_scripts) | Scripts gerais de cliente e servidor, incluindo utilidades e ajustes de gameplay. |
| [`pz_stash`](./[pz]/pz_stash) | Sistema de armazenamento (stash). |
| [`pz_target`](./[pz]/pz_target) | Interações por alvo com objetos, animais, veículos e atividades do mundo. |
| [`pz_tutorial`](./[pz]/pz_tutorial) | Tutorial integrado ao jogo com interface web. |
| [`pz_vehicles`](./[pz]/pz_vehicles) | Sistemas e interface relacionados a veículos. |

Os resumos acima foram inferidos da organização e dos arquivos presentes em cada recurso. Consulte os `fxmanifest.lua`, configurações e arquivos-fonte de cada pasta para conhecer os detalhes de implementação e dependências.

### `[ox]` — dependências de terceiros

| Recurso | Finalidade |
|---|---|
| [`ox_doorlock`](./[ox]/ox_doorlock) | Controle de portas e fechaduras. |
| [`ox_inventory`](./[ox]/ox_inventory) | Inventário e gerenciamento de itens. |
| [`ox_lib`](./[ox]/ox_lib) | Biblioteca compartilhada de utilidades para recursos FiveM. |
| [`ox_target`](./[ox]/ox_target) | Sistema de interação por alvo. |
| [`oxmysql`](./[ox]/oxmysql) | Integração entre recursos FiveM e MySQL. |

## Instalação e uso

Este repositório é uma coleção de recursos, não uma instalação completa de servidor FiveM. Para utilizá-los:

1. Confira os requisitos e a configuração descritos no `fxmanifest.lua`, `README.md` e arquivos de configuração do recurso escolhido.
2. Instale as dependências necessárias e configure a conexão com o banco de dados quando aplicável.
3. Coloque os recursos na pasta de recursos do servidor e configure a ordem de inicialização no `server.cfg` conforme as dependências.
4. Revise configurações, permissões, eventos e integrações antes de executar em outro servidor. Os recursos foram preparados para o contexto do Projeto Z e podem exigir adaptações.

## Créditos e licenças

Os scripts próprios em `[pz]` são disponibilizados sob a **GNU General Public License v3.0 (GPL-3.0-only)**. O texto integral está no arquivo [`LICENSE`](./LICENSE). Ao redistribuir versões desses recursos, modificadas ou não, observe os termos da GPLv3, incluindo a disponibilização do código-fonte correspondente e a preservação dos avisos aplicáveis.

A licença deste repositório não substitui nem altera as licenças dos recursos de terceiros em `[ox]` ou de outros arquivos que indiquem titulares/licenças próprios. Consulte os arquivos `LICENSE`, `README.md` e cabeçalhos de cada recurso, preserve avisos de copyright e cumpra os termos originais antes de redistribuir. A distribuição conjunta de componentes sob licenças diferentes pode exigir análise de compatibilidade; não assuma que a GPLv3 da pasta `[pz]` automaticamente relicencia todo o conteúdo do repositório.

**Atribuição dos scripts próprios:** Projeto Z RP contributors, 2026. @victorfelixdev

### Direitos sobre o Projeto Z RP

1. [Projeto Z RP — perfil de João Pedro Moreno no LinkedIn](https://br.linkedin.com/in/joao-pedro-moreno).
2. [Projeto Z RP — perfil de Victor Felix no LinkedIn](https://br.linkedin.com/in/victor-felix-dev).
3. [Vídeo de apresentação do Projeto Z RP no YouTube](https://www.youtube.com/watch?v=PdEA6jIQCIg), publicação sobre o servidor como experiência de sobrevivência em GTA V/FiveM.

