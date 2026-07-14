# qbx_radialmenu — Manual

Menu radial do `ox_lib` com as interações do jogador: portas, janelas, extras, pinturas e assentos do veículo, controle de roupas, opções por job/gangue e o sistema de porta-malas.

---

## Sumário

1. [Dependências](#dependências)
2. [Instalação](#instalação)
3. [Configuração](#configuração)
4. [Comandos](#comandos)
5. [Menu do veículo](#menu-do-veículo)
6. [Opções por job e gangue](#opções-por-job-e-gangue)
7. [Estado de morte](#estado-de-morte)
8. [Porta-malas](#porta-malas)
9. [Integrações](#integrações)
10. [Entrypoints para outros recursos](#entrypoints-para-outros-recursos)
11. [Localização](#localização)
12. [Estrutura de arquivos](#estrutura-de-arquivos)

---

## Dependências

| Recurso | Obrigatório | Observação |
|---|---|---|
| `qbx_core` | Sim | Framework base, notificações e os módulos `lib.lua` e `playerdata.lua` |
| `ox_lib` | Sim | O menu radial em si (`lib.registerRadial`, `lib.addRadialItem`), progress bar, locale. O menu é aberto pela tecla do próprio `ox_lib` |
| `qbx_seatbelt` | Sim | `HasHarness()` — bloqueia a troca de assento com cinto de competição |
| `qbx_medical` | Não | Statebag `qbx_medical:deathState` reduz o menu quando o jogador cai |
| `qb-ambulancejob` | Não | Alternativa ao anterior via evento `hospital:server:SetDeathStatus` |
| Job de polícia | Não | O botão de emergência dispara `police:client:SendPoliceEmergencyAlert` |
| Job de EMS | Não | O botão de emergência dispara `hospital:server:emergencyAlert` |
| Recurso de controle de veículo | Não | O item "Menu do veículo" dispara `vehcontrol:openExternal` |

Os itens padrão do config também apontam para eventos de terceiros (`qb-drugs:client:cornerselling`, `qb-tow:client:TowVehicle`, `qb-tow:client:ToggleNpc`). Se o recurso correspondente não existir, o item simplesmente não faz nada — remova-o do config.

---

## Instalação

1. Copie a pasta `qbx_radialmenu` para `resources/`.
2. Adicione ao `server.cfg`, depois do `qbx_core`:
   ```
   ensure qbx_radialmenu
   ```
3. Ajuste `config/client.lua` com os itens do seu servidor. O arquivo já vem com boa parte dos itens comentados; descomente apenas os que têm o recurso correspondente instalado.
4. **Conflitos** — não rode junto com o `qb-radialmenu`. Este recurso registra os mesmos eventos (`qb-radialmenu:*`, `qb-trunk:*`) e os mesmos comandos de roupa.

---

## Configuração

Arquivo: `config/client.lua`.

| Campo | Tipo | Obrigatório | Descrição |
|---|---|---|---|
| `enableExtraMenu` | bool | Sim | Mostra o submenu de extras do veículo |
| `enableLiveryMenu` | bool | Sim | Mostra o submenu de pinturas (liveries) do veículo |
| `flipTime` | ms | Sim | Duração da barra de progresso para desvirar um veículo |
| `menuItems` | array | Sim | Itens sempre presentes no radial. Cada um: `id`, `icon`, `label` e um `event`, `serverEvent`, `command`, `action`, `onSelect` ou uma sublista `items` |
| `jobItems` | tabela por job | Sim | Itens que aparecem só para o job, e só em serviço. Indexado pelo nome do job |
| `gangItems` | tabela por gangue | Sim | Itens que aparecem só para membros da gangue. Indexado pelo nome da gangue |
| `vehicleDoors` | tabela | Sim | Submenu das portas. Cada item dispara `qb-radialmenu:client:openDoor` com o índice da porta |
| `vehicleWindows` | tabela | Sim | Submenu das janelas. Cada item dispara `qbx_radialmenu:client:toggleWindows` |
| `vehicleSeats` | tabela | Sim | Entrada do submenu de assentos. A lista é gerada em runtime a partir do número de assentos do veículo |
| `vehicleExtras` | tabela | Sim | Submenu de extras (`radialmenu:client:setExtra`) |
| `vehicleLiveries` | tabela | Sim | Submenu de pinturas (`radialmenu:client:setLivery`) |
| `trunkClasses` | tabela por classe | Sim | Por classe de veículo: `allowed` (pode entrar no porta-malas) e o offset `x`, `y`, `z` onde a pessoa é posicionada |
| `clothingCommands` | tabela | Sim | Comandos de roupa. Cada entrada vira um comando de chat com o mesmo nome da chave |

### Formato de um item

```lua
{
    id = 'cornerselling',              -- id único
    icon = 'cannabis',                 -- ícone Font Awesome
    label = 'Venda de Esquina',
    event = 'qb-drugs:client:cornerselling',  -- ou serverEvent / command / action / onSelect
    args = nil,                        -- argumento passado ao evento/comando
    -- items = { ... }                 -- se presente, o item vira um submenu
}
```

---

## Comandos

### Porta-malas

| Comando | Permissão | Descrição |
|---|---|---|
| `/getintrunk` | Qualquer jogador | Entra no porta-malas do veículo mais próximo |
| `/putintrunk` | Qualquer jogador | Coloca a pessoa mais próxima no porta-malas (fluxo de sequestro) |

### Roupas

Registrados a partir das chaves de `config.clothingCommands`, um comando por chave:

| Comando | Permissão | Descrição |
|---|---|---|
| `/top` | Qualquer jogador | Tira/coloca a parte de cima |
| `/shirt` | Qualquer jogador | Tira/coloca a camisa (undershirt) |
| `/pants` | Qualquer jogador | Tira/coloca a calça |
| `/shoes` | Qualquer jogador | Tira/coloca os sapatos |
| `/gloves` | Qualquer jogador | Tira/coloca as luvas |
| `/vest` | Qualquer jogador | Tira/coloca o colete |
| `/bag` | Qualquer jogador | Tira/coloca a mochila |
| `/bagoff` | Qualquer jogador | Alterna a mochila/paraquedas nas costas |
| `/hair` | Qualquer jogador | Alterna o cabelo |
| `/hat` | Qualquer jogador | Tira/coloca o chapéu |
| `/glasses` | Qualquer jogador | Tira/coloca os óculos |
| `/visor` | Qualquer jogador | Alterna a viseira |
| `/mask` | Qualquer jogador | Tira/coloca a máscara |
| `/ear` | Qualquer jogador | Tira/coloca os brincos |
| `/neck` | Qualquer jogador | Tira/coloca o colar |
| `/watch` | Qualquer jogador | Tira/coloca o relógio |
| `/bracelet` | Qualquer jogador | Tira/coloca a pulseira |
| `/reset` | Qualquer jogador | Devolve todas as peças removidas |

As mesmas ações estão no radial, em Geral > Roupas.

---

## Menu do veículo

O item "Veículo" é montado dinamicamente e reage a entrar/sair do carro (`lib.onCache('vehicle')`).

| Opção | Comportamento |
|---|---|
| Desvirar veículo | Só fora do carro. Barra de progresso de `flipTime` ms com animação de reparo; ao final, coloca o veículo mais próximo de pé |
| Menu do veículo | Dispara `vehcontrol:openExternal` |
| Portas | Abre/fecha a porta escolhida. Se o motorista de outro veículo estiver no banco, a ação é sincronizada pelo servidor via `qb-radialmenu:trunk:server:Door` |
| Janelas | Abre/quebra e restaura a janela escolhida |
| Extras | Só com `enableExtraMenu`. Liga/desliga o extra do veículo |
| Pinturas | Só com `enableLiveryMenu`. Aplica a livery; se já estiver aplicada, remove. Exige ser o motorista |
| Assentos | Só dentro do veículo. Lista gerada pelo número de assentos do modelo. Bloqueia a troca se o assento estiver ocupado, se a velocidade passar de 100 km/h ou se o jogador estiver de cinto de competição (`qbx_seatbelt`) |

---

## Opções por job e gangue

- `jobItems[<job>]` — o grupo "Interações de trabalho" só aparece se o job do jogador tiver itens **e** ele estiver em serviço. Sai do menu ao sair de serviço (`QBCore:Client:SetDuty`) e é recalculado a cada troca de job.
- `gangItems[<gangue>]` — o grupo "Interações de gangue" aparece para membros da gangue correspondente e é recalculado a cada troca de gangue.

De fábrica, `jobItems` traz `mechanic` (reboque) e `tow` (alternar NPC, reboque); os blocos de polícia, EMS e táxi vêm comentados. `gangItems` vem vazio.

---

## Estado de morte

O recurso escuta a statebag `qbx_medical:deathState` (e o evento `hospital:server:SetDeathStatus`, para compatibilidade com o `qb-ambulancejob`).

- Jogador caído — o radial é limpo. Se ele for polícia em serviço, sobra apenas o botão de emergência; nos demais casos o radial é desabilitado por completo.
- Jogador recuperado — o menu é reconstruído do zero.

---

## Porta-malas

- `/getintrunk` coloca o jogador dentro do porta-malas do veículo mais próximo, com câmera externa e texto na tela. O veículo precisa ter o porta-malas aberto, estar vazio e ser de uma classe com `allowed = true` em `trunkClasses`.
- Alguns modelos (superesportivos como `zentorno`, `infernus`, `jester`, entre outros) estão em uma lista fixa de bloqueio dentro de `client/trunk.lua`, mesmo que a classe seja permitida.
- O offset `x`, `y`, `z` de `trunkClasses` define onde a pessoa é posicionada dentro do porta-malas.
- O servidor guarda o estado "porta-malas ocupado" por placa e responde pelo callback `qb-trunk:server:getTrunkBusy`, impedindo duas pessoas no mesmo porta-malas.

---

## Integrações

### qbx_seatbelt

`HasHarness()` é consultado antes de trocar de assento. Com cinto de competição, a troca é recusada.

### qbx_medical / qb-ambulancejob

Definem quando o jogador está caído, o que reduz ou desabilita o radial. Ver [Estado de morte](#estado-de-morte).

### Jobs de polícia e EMS

O botão de emergência que aparece para quem está caído dispara `police:client:SendPoliceEmergencyAlert` (job type `leo`) ou `hospital:server:emergencyAlert` (job type `ems`).

### Recursos com menu radial legado (`qb-radialmenu`)

Os exports `AddOption` e `RemoveOption` também são registrados sob o nome `qb-radialmenu`, então recursos escritos para o menu radial antigo continuam funcionando sem alteração:

```lua
exports['qb-radialmenu']:AddOption(data, id)
exports['qb-radialmenu']:RemoveOption(id)
```

---

## Entrypoints para outros recursos

### Adicionar e remover opções (cliente)

```lua
-- Retorna o id da opção
local id = exports.qbx_radialmenu:AddOption({
    id = 'minhaOpcao',
    title = 'Minha opção',
    label = 'Minha opção',
    icon = 'star',
    event = 'meu_recurso:client:acao',   -- ou serverEvent / command / action / onSelect
    args = nil,
}, 'minhaOpcao')

exports.qbx_radialmenu:RemoveOption('minhaOpcao')
```

Um item com `items` vira um submenu radial próprio.

### Eventos de cliente

```lua
TriggerEvent('qb-radialmenu:client:openDoor', 0)          -- índice da porta
TriggerEvent('qbx_radialmenu:client:toggleWindows', 0)    -- índice da janela
TriggerEvent('radialmenu:client:setExtra', 1)
TriggerEvent('radialmenu:client:setLivery', 1)
TriggerEvent('radialmenu:client:ChangeSeat', 2, 'Passageiro')
TriggerEvent('radialmenu:flipVehicle')

-- Roupas
TriggerEvent('qb-radialmenu:ToggleClothing', { 'Top' })
TriggerEvent('qb-radialmenu:ToggleProps', { 'Hat' })
TriggerEvent('qb-radialmenu:ResetClothing')

-- Porta-malas
TriggerEvent('qb-trunk:client:GetIn')
```

### Eventos de servidor

```lua
TriggerClientEvent('radialmenu:client:deadradial', src, isDead)  -- reduz/restaura o radial
TriggerEvent('qb-trunk:server:setTrunkBusy', plate, true)
TriggerEvent('qb-radialmenu:trunk:server:Door', open, plate, door)
```

### Callback (`lib.callback`)

```lua
local ocupado = lib.callback.await('qb-trunk:server:getTrunkBusy', false, plate)
```

---

## Localização

Strings via `ox_lib` locale. Arquivos em `locales/`:

- `cs.json`, `da.json`, `de.json`, `en.json`, `es.json`, `et.json`, `fr.json`, `it.json`, `nl.json`, `pl.json`, `pt-br.json`, `pt.json`, `sv.json`, `tr.json`

Idioma ativo pela convar no `server.cfg`:

```
setr ox:locale "pt-br"
```

Os `label` dos itens do `config/client.lua` não passam pelo locale — são texto fixo e devem ser traduzidos direto no config.

---

## Estrutura de arquivos

```
qbx_radialmenu/
├── client/
│   ├── main.lua       — montagem do radial, menu do veículo, job/gangue, estado de morte, exports
│   ├── clothing.lua   — comandos e eventos de roupas e acessórios
│   └── trunk.lua      — entrar no porta-malas, câmera e sequestro
├── server/
│   ├── main.lua       — statebag de morte e compatibilidade com qb-ambulancejob
│   └── trunk.lua      — estado do porta-malas por placa, sincronização de portas, comandos
├── config/
│   └── client.lua     — itens do radial, veículo, porta-malas e comandos de roupa
├── locales/           — cs, da, de, en, es, et, fr, it, nl, pl, pt-br, pt, sv, tr
└── fxmanifest.lua
```
