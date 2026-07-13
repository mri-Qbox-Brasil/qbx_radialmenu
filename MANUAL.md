# Manual do qbx_radialmenu

Sistema de menu radial moderno para Qbox — acesso rápido a controles de veículos, roupas e ações de emprego através de interface circular intuitiva com ícones FontAwesome 5.

## Funcionalidades Principais

### 🎨 Interface
- **Ícones FontAwesome 5**: Suporte completo a ícones FA5 (brands, light, regular, solid)
- **Menu Circular**: Interface intuitiva com navegação por setas ou mouse
- **Animações Suaves**: Transições entre menus e submenus

### 🚗 Controles de Veículos
- **Portas**: Abrir/fechar todas as portas (motorista, passageiro, traseiras)
- **Janelas**: Abrir/fechar janelas
- **Assentos**: Trocar de assento
- **Extras**: Ativar/desativar extras do veículo (1-13)
- **Liveries**: Alterar pintura/livery do veículo (1-13)
- **Porta-Malas**: Interação com porta-malas (abrir/fechar)

### 👕 Sistema de Roupas
Alternar visibilidade de itens de roupa:
- Chapéus
- Óculos
- Máscaras
- Colete
- Bolsas
- Camisas
- Calças
- Sapatos
- Acessórios

### 💼 Menus de Emprego
Itens personalizados para empregos específicos:
- **Polícia**: Alerta de emergência, etc.
- **Mecânico**: Guincho, reparos
- **Táxi**: Iniciar corrida
- **Personalizável**: Adicione itens para qualquer emprego

### 🌍 Localização
- Suporte a múltiplos idiomas via ox_lib
- Arquivos de tradução em `locales/`

## Configuração (config/client.lua)

### Menu Principal
```lua
menuItems = {
    {
        id = 'citizen',
        icon = 'user',
        label = 'Cidadão',
        items = {
            {
                id = 'myaction',
                icon = 'star',
                label = 'Minha Ação',
                event = 'myresource:client:doSomething'
            },
        },
    },
    {
        id = 'vehicle',
        icon = 'car',
        label = 'Veículo',
        items = {
            -- itens de veículo serão adicionados automaticamente
        }
    }
}
```

### Portas do Veículo
```lua
vehicleDoors = {
    id = 'vehicleDoors',
    icon = 'car-side',
    label = 'Portas do Veículo',
    items = {
        { id = 'door0', icon = 'car-side', label = 'Porta do Motorista', event = 'qbx_radialmenu:client:openDoor', args = 0 },
        { id = 'door1', icon = 'car-side', label = 'Porta do Passageiro', event = 'qbx_radialmenu:client:openDoor', args = 1 },
        { id = 'door2', icon = 'car-side', label = 'Porta Traseira Esquerda', event = 'qbx_radialmenu:client:openDoor', args = 2 },
        { id = 'door3', icon = 'car-side', label = 'Porta Traseira Direita', event = 'qbx_radialmenu:client:openDoor', args = 3 },
        { id = 'hood', icon = 'car', label = 'Capô', event = 'qbx_radialmenu:client:openDoor', args = 4 },
        { id = 'trunk', icon = 'car-rear', label = 'Porta-Malas', event = 'qbx_radialmenu:client:openDoor', args = 5 },
    },
}
```

### Acesso ao Porta-Malas
```lua
trunkClasses = {
    [0] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupés
    [1] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sedans
    [2] = {allowed = true, x = 0.0, y = -2.5, z = 0.0}, -- SUVs
    -- ... configure por classe
}
```

### Itens de Emprego
```lua
jobItems = {
    police = {
        { id = 'emergencyButton', icon = 'bell', label = 'Alerta de Emergência', event = 'police:client:SendPoliceEmergencyAlert' },
        { id = 'checkLicenses', icon = 'id-card', label = 'Verificar Licenças', event = 'police:client:checkLicenses' },
    },
    mechanic = {
        { id = 'towVehicle', icon = 'truck-pickup', label = 'Guinchar Veículo', event = 'qb-tow:client:TowVehicle' },
        { id = 'repairVehicle', icon = 'wrench', label = 'Reparar Veículo', event = 'qb-mechanic:client:repairVehicle' },
    },
}
```

### Comandos de Roupas
```lua
clothingCommands = {
    top = {
        Func = function() ToggleClothing({'Top'}) end,
        Sprite = 'top',
        Desc = 'Tirar/vestir camisa',
        Button = 1,
        Name = 'Torso',
    },
    -- ... mais itens
}
```

## Exports (API)

### Client Exports

| Exportação | Parâmetros | Descrição |
|--------|-------------|-------------|
| `ToggleClothing` | `{id: string}` | Alternar roupa liga/desliga |
| `ToggleProps` | `propName: string` | Alternar acessórios (chapéus, óculos) |
| `ResetClothing` | `force: boolean` | Resetar todas as alterações |

### Exemplos de Uso
```lua
-- Alternar camisa
exports['qbx_radialmenu']:ToggleClothing({id = 'Shirt'})

-- Alternar chapéu
exports['qbx_radialmenu']:ToggleProps('Hat')

-- Resetar todas as alterações
exports['qbx_radialmenu']:ResetClothing(true)
```

## Eventos

### Client Events

| Evento | Parâmetros | Descrição |
|-------|----------|-------------|
| `qb-radialmenu:ToggleClothing` | `{id: string}` | Alternar roupa |
| `qb-radialmenu:ToggleProps` | `propName: string` | Alternar prop |
| `qbx_radialmenu:client:openDoor` | `doorIndex: number` | Abrir/fechar porta |
| `qbx_radialmenu:client:toggleWindows` | `windowIndex: number` | Alternar janela |
| `radialmenu:client:setExtra` | `extraId: number` | Alternar extra |
| `radialmenu:client:setLivery` | `liveryId: number` | Alterar livery |

### Server Events

| Evento | Parâmetros | Descrição |
|-------|----------|-------------|
| `qbx_radialmenu:server:openDoor` | `doorIndex: number` | Tratamento servidor |

## Ícones FontAwesome

Obtenha nomes em [FontAwesome 5](https://fontawesome.com/v5.0/icons)

**Regras:**
- Use apenas o nome do ícone (ex: `arrow-right`)
- NÃO use prefixo `fa-` ou `#`
- Suporta: brands, light, regular, solid

## Estrutura de Arquivos

```
qbx_radialmenu/
├── client/
│   ├── clothing.lua      # Alternar roupas
│   ├── main.lua          # Lógica principal do menu
│   └── trunk.lua         # Interação com porta-malas
├── server/
│   ├── main.lua          # Lógica do servidor
│   └── trunk.lua         # Processamento de porta-malas
├── config/
│   └── client.lua        # Configuração do menu
└── locales/               # Traduções
```

## Dependências

| Recurso | Obrigatório | Descrição |
|----------|-----------|-------------|
| ox_lib | ✅ | Componentes de UI e localização |
| qbx_core | ✅ | Framework principal |

## Limitações

- **Extras de veículos**: Limitados a 13 slots (extra 1-13)
- **Liveries**: Limitadas a 13 slots (livery 1-13)
- **Roupas/Props**: Suporta 14 tipos diferentes

## Solução de Problemas

### Menu não abre
- Verifique se a tecla de atalho está configurada
- Confirme que o recurso está rodando
- Verifique se há erros no console

### Ícone não aparece
- Verifique se o nome do ícone está correto
- Confirme que é um ícone FA5 gratuito
- NÃO use prefixo `fa-`

### Roupa não alterna
- Verifique se o ID da roupa está correto
- Confirme que o componente existe no jogo
- Verifique se não há conflito com outras rotinas

### Porta do veículo não abre
- Verifique se o veículo está próximo
- Confirme que a porta não está danificada
- Verifique o evento `qbx_radialmenu:client:openDoor`

### Item de emprego não aparece
- Verifique se o jogador tem o emprego correto
- Confirme a configuração em `jobItems`
- Reinicie o recurso após alterações

### Porta-malas não funciona
- Verifique `trunkClasses` para a classe do veículo
- Confirme que o veículo permite acesso ao porta-malas
- Verifique as coordenadas de acesso
