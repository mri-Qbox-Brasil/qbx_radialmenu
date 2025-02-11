local bags = {[40] = true, [41] = true, [44] = true, [45] = true}

return {
    enableExtraMenu = true,
    enableLiveryMenu = true,
    flipTime = 15000,

    menuItems = {
        {
            id = 'citizen',
            icon = 'user',
            label = 'Cidadão',
            items = {
                -- {
                --     id = 'givenum',
                --     icon = 'address-book',
                --     label = 'Dar Contato',
                --     event = 'qb-phone:client:GiveContactDetails'
                -- },
                -- {
                --     id = 'getintrunk',
                --     icon = 'car',
                --     label = 'Entrar no Porta-malas',
                --     event = 'qb-trunk:client:GetIn'
                -- },
                {
                    id = 'cornerselling',
                    icon = 'cannabis',
                    label = 'Venda de Esquina',
                    event = 'qb-drugs:client:cornerselling'
                },
                -- {
                --     id = 'interactions',
                --     icon = 'exclamation-triangle',
                --     label = 'Interação',
                --     items = {
                --         {
                --             id = 'handcuff',
                --             icon = 'user-lock',
                --             label = 'Algema',
                --             event = 'police:client:CuffPlayer',
                --         },
                --         {
                --             id = 'playerInVehicle',
                --             icon = 'car-side',
                --             label = 'Colocar no Veículo',
                --             event = 'police:client:PutPlayerInVehicle',
                --         },
                --         {
                --             id = 'playerOutVehicle',
                --             icon = 'car-side',
                --             label = 'Retirar do Veículo',
                --             event = 'police:client:SetPlayerOutVehicle',
                --         },
                --         {
                --             id = 'stealPlayer',
                --             icon = 'mask',
                --             label = 'Roubar',
                --             event = 'police:client:RobPlayer',
                --         },
                --         {
                --             id = 'kidnapPlayer',
                --             icon = 'user-group',
                --             label = 'Sequestrar',
                --             event = 'police:client:KidnapPlayer',
                --         },
                --         {
                --             id = 'escortPlayer',
                --             icon = 'user-group',
                --             label = 'Escoltar',
                --             event = 'police:client:EscortPlayer',
                --         },
                --         {
                --             id = 'takeHostage',
                --             icon = 'child',
                --             label = 'Fazer Refém',
                --             event = 'police:client:TakeHostage',
                --         },
                --     },
                -- },
            },
        },
        {
            id = 'general',
            icon = 'rectangle-list',
            label = 'Geral',
            items = {
                -- {
                --     id = 'house',
                --     icon = 'home',
                --     label = 'Interação com Casa',
                --     items = {
                --         {
                --             id = 'givehousekey',
                --             icon = 'key',
                --             label = 'Dar Chaves da Casa',
                --             event = 'qb-houses:client:giveHouseKey',
                --         },
                --         {
                --             id = 'removehousekey',
                --             icon = 'key',
                --             label = 'Remover Chaves da Casa',
                --             event = 'qb-houses:client:removeHouseKey',
                --         },
                --         {
                --             id = 'togglelock',
                --             icon = 'door-closed',
                --             label = 'Alternar Trava da Porta',
                --             event = 'qb-houses:client:toggleDoorlock',
                --         },
                --         {
                --             id = 'decorate',
                --             icon = 'box',
                --             label = 'Decorar',
                --             event = 'qb-houses:client:decorate',
                --         },
                --         {
                --             id = 'houseLocations',
                --             icon = 'home',
                --             label = 'Localizações da Casa',
                --             event = 'qb-houses:client:manageHouses',
                --             items = {
                --                 {
                --                     id = 'setStash',
                --                     icon = 'box-open',
                --                     label = 'Definir Baú',
                --                     event = 'qb-houses:client:setLocation',
                --                 },
                --                 {
                --                     id = 'setWardrobe',
                --                     icon = 'shirt',
                --                     label = 'Definir Guarda-Roupas',
                --                     event = 'qb-houses:client:setLocation',
                --                 },
                --                 {
                --                     id = 'setLogout',
                --                     icon = 'door-open',
                --                     label = 'Definir Desconexão',
                --                     event = 'qb-houses:client:setLocation',
                --                 },
                --             },
                --         },
                --     },
                -- },
                {
                    id = 'clothesMenu',
                    icon = 'shirt',
                    label = 'Roupas',
                    items = {
                        {
                            id = 'hair',
                            icon = 'user',
                            label = 'Cabelo',
                            event = 'qb-radialmenu:ToggleClothing',
                            args = {id = 'Hair'},
                        },
                        {
                            id = 'ear',
                            icon = 'ear-deaf',
                            label = 'Fone de Ouvido',
                            event = 'qb-radialmenu:ToggleProps',
                            args = 'Ear',
                        },
                        {
                            id = 'neck',
                            icon = 'user-tie',
                            label = 'Pescoço',
                            event = 'qb-radialmenu:ToggleClothing',
                            args = {id = 'Neck'},
                        },
                        {
                            id = 'top',
                            icon = 'shirt',
                            label = 'Topo',
                            event = 'qb-radialmenu:ToggleClothing',
                            args = {id = 'Top'},
                        },
                        {
                            id = 'shirt',
                            icon = 'shirt',
                            label = 'Camisa',
                            event = 'qb-radialmenu:ToggleClothing',
                            args = {id = 'Shirt'},
                        },
                        {
                            id = 'pants',
                            icon = 'user',
                            label = 'Calças',
                            event = 'qb-radialmenu:ToggleClothing',
                            args = {id = 'Pants'},
                        },
                        {
                            id = 'shoes',
                            icon = 'shoe-prints',
                            label = 'Sapatos',
                            event = 'qb-radialmenu:ToggleClothing',
                            args = {id = 'Shoes'},
                        },
                        {
                            id = 'clothingExtras',
                            icon = 'plus',
                            label = 'Extras',
                            items = {
                                {
                                    id = 'hat',
                                    icon = 'hat-cowboy-side',
                                    label = 'Chapéu',
                                    event = 'qb-radialmenu:ToggleProps',
                                    args = 'Hat',
                                },
                                {
                                    id = 'glasses',
                                    icon = 'glasses',
                                    label = 'Óculos',
                                    event = 'qb-radialmenu:ToggleProps',
                                    args = 'Glasses',
                                },
                                {
                                    id = 'visor',
                                    icon = 'hat-cowboy-side',
                                    label = 'Viseira',
                                    event = 'qb-radialmenu:ToggleProps',
                                    args = 'Visor',
                                },
                                {
                                    id = 'mask',
                                    icon = 'masks-theater',
                                    label = 'Máscara',
                                    event = 'qb-radialmenu:ToggleClothing',
                                    args = {id = 'Mask'},
                                },
                                {
                                    id = 'vest',
                                    icon = 'vest',
                                    label = 'Colete',
                                    event = 'qb-radialmenu:ToggleClothing',
                                    args = {id = 'Vest'},
                                },
                                {
                                    id = 'bag',
                                    icon = 'bag',
                                    label = 'Bolsa',
                                    event = 'qb-radialmenu:ToggleClothing',
                                    args = {id = 'Bag'},
                                },
                                {
                                    id = 'bracelet',
                                    icon = 'user',
                                    label = 'Pulseira',
                                    event = 'qb-radialmenu:ToggleProps',
                                    args = 'Bracelet',
                                },
                                {
                                    id = 'watch',
                                    icon = 'stopwatch',
                                    label = 'Relógio',
                                    event = 'qb-radialmenu:ToggleProps',
                                    args = 'Watch',
                                },
                                {
                                    id = 'gloves',
                                    icon = 'mitten',
                                    label = 'Luvas',
                                    event = 'qb-radialmenu:ToggleClothing',
                                    args = {id = 'Gloves'},
                                },
                            },
                        },
                    },
                },
            },
        },
    },

    jobItems = {
        -- police = {
        --     {
        --         id = 'emergencyButton',
        --         icon = 'bell',
        --         label = 'Botão de Emergência',
        --         event = 'police:client:SendPoliceEmergencyAlert',
        --     },
        --     {
        --         id = 'resetHouse',
        --         icon = 'key',
        --         label = 'Redefinir Trava da Casa',
        --         event = 'qb-houses:client:ResetHouse',
        --     },
        --     {
        --         id = 'revokeDriversLicense',
        --         icon = 'id-card',
        --         label = 'Revogar Carteira de Motorista',
        --         event = 'police:client:SeizeDriverLicense',
        --     },
        --     {
        --         id = 'policeInteractions',
        --         icon = 'list-check',
        --         label = 'Interações Policiais',
        --         items = {
        --             {
        --                 id = 'statusCheck',
        --                 icon = 'heart-pulse',
        --                 label = 'Verificar Estado de Saúde',
        --                 event = 'hospital:client:CheckStatus',
        --             },
        --             {
        --                 id = 'escort',
        --                 icon = 'user-group',
        --                 label = 'Acompanhar',
        --                 event = 'police:client:EscortPlayer',
        --             },
        --             {
        --                 id = 'search',
        --                 icon = 'magnifying-glass',
        --                 label = 'Buscar',
        --                 event = 'police:client:SearchPlayer',
        --             },
        --             {
        --                 id = 'jail',
        --                 icon = 'user-lock',
        --                 label = 'Prisão',
        --                 event = 'police:client:JailPlayer',
        --             },
        --         },
        --     },
        --     {
        --         id = 'policeObjects',
        --         icon = 'road',
        --         label = 'Objetos Policiais',
        --         items = {
        --             {
        --                 id = 'cone',
        --                 icon = 'triangle-exclamation',
        --                 label = 'Cone',
        --                 event = 'police:client:spawnPObj',
        --                 args = 'cone',
        --             },
        --             {
        --                 id = 'gate',
        --                 icon = 'torii-gate',
        --                 label = 'Portão',
        --                 event = 'police:client:spawnPObj',
        --                 args = 'barrier',
        --             },
        --             {
        --                 id = 'speedSign',
        --                 icon = 'sign-hanging',
        --                 label = 'Sinal de Limite de Velocidade',
        --                 event = 'police:client:spawnPObj',
        --                 args = 'roadsign',
        --             },
        --             {
        --                 id = 'tent',
        --                 icon = 'campground',
        --                 label = 'Tenda',
        --                 event = 'police:client:spawnPObj',
        --                 args = 'tent',
        --             },
        --             {
        --                 id = 'lighting',
        --                 icon = 'lightbulb',
        --                 label = 'Iluminação',
        --                 event = 'police:client:spawnPObj',
        --                 args = 'light',
        --             },
        --             {
        --                 id = 'spikeStrip',
        --                 icon = 'caret-up',
        --                 label = 'Pneu Furado',
        --                 event = 'police:client:SpawnSpikeStrip',
        --             },
        --             {
        --                 id = 'deleteObject',
        --                 icon = 'trash',
        --                 label = 'Excluir Objeto',
        --                 event = 'police:client:deleteObject',
        --             },
        --         },
        --     },
        -- },
        -- ambulance = {
        --     {
        --         id = 'statusCheck',
        --         icon = 'heart-pulse',
        --         label = 'Verificar Estado de Saúde',
        --         event = 'hospital:client:CheckStatus',
        --     },
        --     {
        --         id = 'revive',
        --         icon = 'user-doctor',
        --         label = 'Reviver',
        --         event = 'hospital:client:RevivePlayer',
        --     },
        --     {
        --         id = 'treatWounds',
        --         icon = 'bandage',
        --         label = 'Curar Ferimentos',
        --         event = 'hospital:client:TreatWounds',
        --     },
        --     {
        --         id = 'emergencyButton',
        --         icon = 'bell',
        --         label = 'Botão de Emergência',
        --         serverEvent = 'hospital:server:emergencyAlert',
        --     },
        --     {
        --         id = 'escort',
        --         icon = 'user-group',
        --         label = 'Acompanhar',
        --         event = 'police:client:EscortPlayer',
        --     },
        -- },
        mechanic = {
            {
                id = 'towVehicle',
                icon = 'truck-pickup',
                label = 'Reboque de Veículo',
                event = 'qb-tow:client:TowVehicle',
            },
        },
        -- taxi = {
        --     {
        --         id = 'togglemeter',
        --         icon = 'eye-slash',
        --         label = 'Mostrar/Ocultar Taxímetro',
        --         event = 'qb-taxi:client:toggleMeter',
        --     },
        --     {
        --         id = 'togglemouse',
        --         icon = 'hourglass-start',
        --         label = 'Iniciar/Parar Taxímetro',
        --         event = 'qb-taxi:client:enableMeter',
        --     },
        --     {
        --         id = 'npcMission',
        --         icon = 'taxi',
        --         label = 'Missão NPC',
        --         event = 'qb-taxi:client:DoTaxiNpc',
        --     },
        -- },
        tow = {
            {
                id = 'togglenpc',
                icon = 'toggle-on',
                label = 'Alternar NPC',
                event = 'qb-tow:client:ToggleNpc',
            },
            {
                id = 'towVehicle',
                icon = 'truck-pickup',
                label = 'Reboque de Veículo',
                event = 'qb-tow:client:TowVehicle',
            },
        },
    },

    gangItems = {},

    vehicleDoors = {
        id = 'vehicleDoors',
        icon = 'car-side',
        label = 'Portas do Veículo',
        items = {
            {
                id = 'door0',
                icon = 'car-side',
                label = 'Porta do Motorista',
                event = 'qb-radialmenu:client:openDoor',
                args = 0,
            },
            {
                id = 'door1',
                icon = 'car-side',
                label = 'Porta do Passageiro',
                event = 'qb-radialmenu:client:openDoor',
                args = 1,
            },
            {
                id = 'door2',
                icon = 'car-side',
                label = 'Porta Traseira Esquerda',
                event = 'qb-radialmenu:client:openDoor',
                args = 2,
            },
            {
                id = 'door3',
                icon = 'car-side',
                label = 'Porta Traseira Direita',
                event = 'qb-radialmenu:client:openDoor',
                args = 3,
            },
            {
                id = 'door4',
                icon = 'car-side',
                label = 'Capô',
                event = 'qb-radialmenu:client:openDoor',
                args = 4,
            },
            {
                id = 'door5',
                icon = 'car-side',
                label = 'Porta-malas',
                event = 'qb-radialmenu:client:openDoor',
                args = 5,
            },
        },
    },

    vehicleSeats = {
        id = 'vehicleSeats',
        icon = 'chair',
        label = 'Assentos do Veículo',
        menu = 'vehicleSeatsMenu'
    },

    vehicleExtras = {
        id = 'vehicleExtras',
        icon = 'plus',
        label = 'Extras do Veículo',
        items = {
            {
                id = 'extra1',
                icon = 'box-open',
                label = 'Extra 1',
                event = 'radialmenu:client:setExtra',
                args = 1,
            },
            {
                id = 'extra2',
                icon = 'box-open',
                label = 'Extra 2',
                event = 'radialmenu:client:setExtra',
                args = 2,
            },
            {
                id = 'extra3',
                icon = 'box-open',
                label = 'Extra 3',
                event = 'radialmenu:client:setExtra',
                args = 3,
            },
            {
                id = 'extra4',
                icon = 'box-open',
                label = 'Extra 4',
                event = 'radialmenu:client:setExtra',
                args = 4,
            },
            {
                id = 'extra5',
                icon = 'box-open',
                label = 'Extra 5',
                event = 'radialmenu:client:setExtra',
                args = 5,
            },
            {
                id = 'extra6',
                icon = 'box-open',
                label = 'Extra 6',
                event = 'radialmenu:client:setExtra',
                args = 6,
            },
            {
                id = 'extra7',
                icon = 'box-open',
                label = 'Extra 7',
                event = 'radialmenu:client:setExtra',
                args = 7,
            },
            {
                id = 'extra8',
                icon = 'box-open',
                label = 'Extra 8',
                event = 'radialmenu:client:setExtra',
                args = 8,
            },
            {
                id = 'extra9',
                icon = 'box-open',
                label = 'Extra 9',
                event = 'radialmenu:client:setExtra',
                args = 9,
            },
            {
                id = 'extra10',
                icon = 'box-open',
                label = 'Extra 10',
                event = 'radialmenu:client:setExtra',
                args = 10,
            },
            {
                id = 'extra11',
                icon = 'box-open',
                label = 'Extra 11',
                event = 'radialmenu:client:setExtra',
                args = 11,
            },
            {
                id = 'extra12',
                icon = 'box-open',
                label = 'Extra 12',
                event = 'radialmenu:client:setExtra',
                args = 12,
            },
            {
                id = 'extra13',
                icon = 'box-open',
                label = 'Extra 13',
                event = 'radialmenu:client:setExtra',
                args = 13,
            },
        },
    },

    vehicleLiveries = {
        id = 'vehicleLiveries',
        icon = 'brush',
        label = 'Plotagens',
        items = {
            {
                id = 'livery1',
                icon = 'palette',
                label = 'Plotagem 1',
                event = 'radialmenu:client:setLivery',
                args = 1,
            },
            {
                id = 'livery2',
                icon = 'palette',
                label = 'Plotagem 2',
                event = 'radialmenu:client:setLivery',
                args = 2,
            },
            {
                id = 'livery3',
                icon = 'palette',
                label = 'Plotagem 3',
                event = 'radialmenu:client:setLivery',
                args = 3,
            },
            {
                id = 'livery4',
                icon = 'palette',
                label = 'Plotagem 4',
                event = 'radialmenu:client:setLivery',
                args = 4,
            },
            {
                id = 'livery5',
                icon = 'palette',
                label = 'Plotagem 5',
                event = 'radialmenu:client:setLivery',
                args = 5,
            },
            {
                id = 'livery6',
                icon = 'palette',
                label = 'Plotagem 6',
                event = 'radialmenu:client:setLivery',
                args = 6,
            },
            {
                id = 'livery7',
                icon = 'palette',
                label = 'Plotagem 7',
                event = 'radialmenu:client:setLivery',
                args = 7,
            },
            {
                id = 'livery8',
                icon = 'palette',
                label = 'Plotagem 8',
                event = 'radialmenu:client:setLivery',
                args = 8,
            },
            {
                id = 'livery9',
                icon = 'palette',
                label = 'Plotagem 9',
                event = 'radialmenu:client:setLivery',
                args = 9,
            },
            {
                id = 'livery10',
                icon = 'palette',
                label = 'Plotagem 10',
                event = 'radialmenu:client:setLivery',
                args = 10,
            },
            {
                id = 'livery11',
                icon = 'palette',
                label = 'Plotagem 11',
                event = 'radialmenu:client:setLivery',
                args = 11,
            },
            {
                id = 'livery12',
                icon = 'palette',
                label = 'Plotagem 12',
                event = 'radialmenu:client:setLivery',
                args = 12,
            },
            {
                id = 'livery13',
                icon = 'palette',
                label = 'Plotagem 13',
                event = 'radialmenu:client:setLivery',
                args = 13,
            },
        },
    },

    trunkClasses = {
        [0] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes
        [1] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sedans
        [2] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- SUVs
        [3] = {allowed = true, x = 0.0, y = -1.5, z = 0.0}, -- Coupes
        [4] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Muscle
        [5] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports Classics
        [6] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Sports
        [7] = {allowed = true, x = 0.0, y = -2.0, z = 0.0}, -- Super
        [8] = {allowed = false, x = 0.0, y = -1.0, z = 0.25}, -- Motorcycles
        [9] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Off-road
        [10] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Industrial
        [11] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Utility
        [12] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Vans
        [13] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Cycles
        [14] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Boats
        [15] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Helicopters
        [16] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Planes
        [17] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Service
        [18] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Emergency
        [19] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Military
        [20] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Commercial
        [21] = {allowed = true, x = 0.0, y = -1.0, z = 0.25}, -- Trains
    },

    clothingCommands = {
        top = {
            Func = function() ToggleClothing({'Top'}) end,
            Sprite = 'top',
            Desc = 'Take your shirt off/on',
            Button = 1,
            Name = 'Torso',
        },
        gloves = {
            Func = function() ToggleClothing({'Gloves'}) end,
            Sprite = 'gloves',
            Desc = 'Take your gloves off/on',
            Button = 2,
            Name = 'Gloves',
        },
        visor = {
            Func = function() ToggleProps({'Visor'}) end,
            Sprite = 'visor',
            Desc = 'Toggle hat variation',
            Button = 3,
            Name = 'Visor',
        },
        bag = {
            Func = function() ToggleClothing({'Bag'}) end,
            Sprite = 'bag',
            Desc = 'Opens or closes your bag',
            Button = 8,
            Name = 'Bag',
        },
        shoes = {
            Func = function() ToggleClothing({'Shoes'}) end,
            Sprite = 'shoes',
            Desc = 'Take your shoes off/on',
            Button = 5,
            Name = 'Shoes',
        },
        vest = {
            Func = function() ToggleClothing({'Vest'}) end,
            Sprite = 'vest',
            Desc = 'Take your vest off/on',
            Button = 14,
            Name = 'Vest',
        },
        hair = {
            Func = function() ToggleClothing({'Hair'}) end,
            Sprite = 'hair',
            Desc = 'Put your hair up/down',
            Button = 7,
            Name = 'Hair',
        },
        hat = {
            Func = function() ToggleProps({'Hat'}) end,
            Sprite = 'hat',
            Desc = 'Take your hat off/on',
            Button = 4,
            Name = 'Hat',
        },
        glasses = {
            Func = function() ToggleProps({'Glasses'}) end,
            Sprite = 'glasses',
            Desc = 'Take your glasses off/on',
            Button = 9,
            Name = 'Glasses',
        },
        ear = {
            Func = function() ToggleProps({'Ear'}) end,
            Sprite = 'ear',
            Desc = 'Take your ear accessory off/on',
            Button = 10,
            Name = 'Ear',
        },
        neck = {
            Func = function() ToggleClothing({'Neck'}) end,
            Sprite = 'neck',
            Desc = 'Take your neck accessory off/on',
            Button = 11,
            Name = 'Neck',
        },
        watch = {
            Func = function() ToggleProps({'Watch'}) end,
            Sprite = 'watch',
            Desc = 'Take your watch off/on',
            Button = 12,
            Name = 'Watch',
            Rotation = 5.0,
        },
        bracelet = {
            Func = function() ToggleProps({'Bracelet'}) end,
            Sprite = 'bracelet',
            Desc = 'Take your bracelet off/on',
            Button = 13,
            Name = 'Bracelet',
        },
        mask = {
            Func = function() ToggleClothing({'Mask'}) end,
            Sprite = 'mask',
            Desc = 'Take your mask off/on',
            Button = 6,
            Name = 'Mask',
        },

        pants = {
            Func = function() ToggleClothing({'Pants', true}) end,
            Sprite = 'pants',
            Desc = 'Take your pants off/on',
            Name = 'Pants',
            OffsetX = -0.04,
            OffsetY = 0.0,
        },
        shirt = {
            Func = function() ToggleClothing({'Shirt', true}) end,
            Sprite = 'shirt',
            Desc = 'Take your shirt off/on',
            Name = 'shirt',
            OffsetX = 0.04,
            OffsetY = 0.0,
        },
        reset = {
            Func = function()
                if not ResetClothing(true) then
                    Notify('Nothing To Reset', 'error')
                end
            end,
            Sprite = 'reset',
            Desc = 'Revert everything back to normal',
            Name = 'reset',
            OffsetX = 0.12,
            OffsetY = 0.2,
            Rotate = true
        },
        bagoff = {
            Func = function() ToggleClothing({'Bagoff', true}) end,
            Sprite = 'bagoff',
            SpriteFunc = function()
                local Bag = GetPedDrawableVariation(cache.ped, 5)
                local BagOff = LastEquipped['Bagoff']
                if LastEquipped['Bagoff'] then
                    if bags[BagOff.Drawable] then
                        return 'bagoff'
                    else
                        return 'paraoff'
                    end
                end
                if Bag ~= 0 then
                    if bags[Bag] then
                        return 'bagoff'
                    else
                        return 'paraoff'
                    end
                else
                    return false
                end
            end,
            Desc = 'Take your bag off/on',
            Name = 'bagoff',
            OffsetX = -0.12,
            OffsetY = 0.2,
        }
    },
}