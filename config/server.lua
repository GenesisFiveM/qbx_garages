return {
    autoRespawn = false, -- True == auto respawn cars that are outside into your garage on script restart, false == does not put them into your garage and players have to go to the impound
    warpInVehicle = false, -- If false, player will no longer warp into vehicle upon taking the vehicle out.
    doorsLocked = true, -- If true, the doors will be locked upon taking the vehicle out.
    distanceCheck = 5.0, -- The distance that needs to bee clear to let the vehicle spawn, this prevents vehicles stacking on top of each other
    ---calculates the automatic impound fee.
    ---@param vehicleId integer
    ---@param modelName string
    ---@return integer fee
    calculateImpoundFee = function(vehicleId, modelName)
        local vehCost = VEHICLES[modelName].price
        return qbx.math.round(vehCost * 0.02) or 0
    end,

    ---@class GarageBlip
    ---@field name? string -- Name of the blip. Defaults to garage label.
    ---@field sprite? number -- Sprite for the blip. Defaults to 357
    ---@field color? number -- Color for the blip. Defaults to 3.

    ---The place where the player can access the garage and spawn a car
    ---@class AccessPoint
    ---@field coords vector4 where the garage menu can be accessed from
    ---@field blip? GarageBlip
    ---@field spawn? vector4 where the vehicle will spawn. Defaults to coords
    ---@field dropPoint? vector3 where a vehicle can be stored, Defaults to spawn or coords

    ---@class GarageConfig
    ---@field label string -- Label for the garage
    ---@field type? GarageType -- Optional special type of garage. Currently only used to mark DEPOT garages.
    ---@field vehicleType VehicleType -- Vehicle type
    ---@field groups? string | string[] | table<string, number> job/gangs that can access the garage
    ---@field shared? boolean defaults to false. Shared garages give all players with access to the garage access to all vehicles in it. If shared is off, the garage will only give access to player's vehicles which they own.
    ---@field states? VehicleState | VehicleState[] if set, only vehicles in the given states will be retrievable from the garage. Defaults to GARAGED.
    ---@field skipGarageCheck? boolean if true, returns vehicles for retrieval regardless of if that vehicle's garage matches this garage's name
    ---@field canAccess? fun(source: number): boolean checks access as an additional guard clause. Other filter fields still need to pass in addition to this function.
    ---@field accessPoints AccessPoint[]

    ---@type table<string, GarageConfig>
    garages = {
        -- PUBLIC GARAGES

        motelgarage = {
            label = 'Motel Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(274.85, -330.65, 45.0),
                    size = vec3(16.5, 21.5, 4.0),
                    rotation = 340.0,
                    spawn = {
                        vec4(269.6993, -331.7990, 44.9199, 167.3412),
                        vec4(281.2246, -330.6856, 44.9199, 173.0709),
                        vec4(286.4353, -332.0774, 44.9199, 249.1360),
                        vec4(288.0334, -346.4720, 44.9199, 160.3437),
                    },

                },
            },
        },
        prisongarage = {
            label = 'Boilingbroke Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(1872.9897, 2577.3501, 45.841),
                    size = vec3(16.5, 21.5, 4.0),
                    rotation = 340.0,
                    spawn = {
                        vec4(1876.5813, 2577.7209, 45.6726, 269.4666),
                        vec4(1876.7252, 2581.1494, 45.6726, 270.0724),
                        vec4(1869.7172, 2581.4475, 45.6726, 91.3658),
                        vec4(1869.7274, 2578.0288, 45.6726, 86.9601),
                    },

                },
            },
        },
        mechgarage = {
            label = 'Wheels Plays Garage',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(-357.32, -92.9, 45.15),
                    size = vec3(30.25, 25.15, 1.35),
                    rotation = 70.0,
                    spawn = {
                        vec4(-345.8030, -88.4543, 45.6642, 72.5413),
                        vec4(-355.6400, -102.2456, 45.6642, 335.1085),
                        vec4(-362.2182, -100.2395, 45.6642, 338.6014),
                        vec4(-368.7880, -97.5463, 45.6634, 340.4041),
                    },

                },
            },
        },
        mirrorparkgarage = {
            label = 'Mirror Park Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(1043.3601, -779.9720, 58.0078),
                    size = vec3(16.5, 21.5, 4.0),
                    rotation = 340.0,
                    spawn = {
                        vec4(1046.2531, -774.4044, 58.0174, 94.7441),
                        vec4(1045.9867, -778.1946, 58.0090, 95.4748),
                        vec4(1045.8550, -781.9207, 58.0006, 91.4647),
                        vec4(1045.8795, -785.6292, 57.9929, 94.7474),
                    },

                },
            },
        },
        groovestreetgarage = {
            label = 'Groove Street Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(-55.9518, -1841.2664, 26.5119),
                    size = vec3(16.5, 21.5, 4.0),
                    rotation = 340.0,
                    spawn = {
                        vec4(-61.8633, -1839.8806, 26.6745, 319.8520),
                        vec4(-59.1719, -1842.0266, 26.5737, 320.0571),
                        vec4(-56.5523, -1844.1041, 26.4758, 322.7513),
                        vec4(-53.8596, -1846.3777, 26.3677, 322.0100),
                    },

                },
            },
        },
        northrockforddrivegarage = {
            label = 'North Rockford Drive Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(-1699.1973, 56.9099, 65.091),
                    size = vec3(16.5, 21.5, 4.0),
                    rotation = 340.0,
                    spawn = {
                        vec4(-1694.9926, 56.2535, 64.7492, 163.8734),
                        vec4(-1697.4709, 58.9450, 64.9361, 175.1306),
                        vec4(-1699.8632, 61.6402, 65.1106, 161.0970),
                        vec4(-1702.5811, 63.8110, 65.3174, 160.4549),
                    },

                },
            },
        },
        greatoceanhwygarage = {
            label = 'Great Ocean HWY Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(-2218.4519, 4241.0190, 47.1719),
                    size = vec3(16.5, 21.5, 4.0),
                    rotation = 340.0,
                    spawn = {
                        vec4(-2214.7900, 4239.7461, 47.4247, 37.5612),
                        vec4(-2217.0781, 4237.8174, 47.3455, 39.9456),
                        vec4(-2219.0886, 4235.3369, 47.2391, 35.9213),
                        vec4(-2212.9783, 4242.6191, 47.5372, 33.5673),
                    },

                },
            },
        },
        route68garage = {
            label = 'Route 68 Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(-1146.1050, 2669.8303, 18.2035),
                    size = vec3(16.5, 21.5, 4.0),
                    rotation = 340.0,
                    spawn = {
                        vec4(-1139.7307, 2670.3718, 18.0939, 223.8560),
                        vec4(-1142.6191, 2666.9265, 18.0939, 223.6012),
                        vec4(-1146.1743, 2663.8313, 18.0939, 226.6101),
                    },

                },
            },
        },
        galileoavenuegarage = {
            label = 'Galileo Ave Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(-418.8952, 1209.1244, 325.6664),
                    size = vec3(16.5, 21.5, 4.0),
                    rotation = 340.0,
                    spawn = {
                        vec4(-420.8493, 1202.6401, 325.6417, 233.3464),
                        vec4(-419.3823, 1206.4436, 325.6417, 241.1333),
                        vec4(-417.8560, 1210.4340, 325.6417, 247.5029),
                        vec4(-416.4701, 1214.4050, 325.6418, 246.7393),
                    },

                },
            },
        },
        capitalblvd = {
            label = 'Capital Blvd Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(1157.3945, -1472.2123, 34.6926),
                    size = vec3(16.5, 21.5, 4.0),
                    rotation = 340.0,
                    spawn = {
                        vec4(1157.3615, -1477.8516, 34.6926, 92.1723),
                        vec4(1157.0062, -1474.2832, 34.6926, 88.3002),
                        vec4(1156.9674, -1470.5863, 34.6926, 90.5437),
                        vec4(1157.1127, -1466.9172, 34.6926, 93.8566),
                    },

                },
            },
        },
        pillboxgarage = {
            label = 'Pillbox Garage Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(214.0, -793.05, 31.0),
                    size = vec3(14.9, 23.0, 2.85),
                    rotation = 340.0,
                    spawn = {
                        vec4(229.33, -805.01, 30.54, 156.79),
                    },
                }
            },
        },
        dumbogarage = {
            label = 'Dumbo Private Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(165.0, -3155.55, 6.0),
                    size = vec3(11, 14.0, 4.0),
                    rotation = 0.0,
                    spawn = {
                        vec4(162.3141, -3141.6611, 5.9533, 258.5472),
                    },
                }
            },
        },
        intairport = {
            label = 'Airport Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(-838.0, -2485.1, 14.0),
                    size = vec3(13.0, 19.2, 2.9),
                    rotation = 17.0,
                    spawn = {
                        vec4(-830.8199, -2501.7778, 13.8305, 83.5542),
                        vec4(-838.6859, -2502.7380, 13.8305, 108.2563),
                    },
                }
            },
        },

        airportp = {
            label = 'Airport Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(-768.0, -2047.0, 9.0),
                    size = vec3(29, 12, 3.0),
                    rotation = 315.0,
                    spawn = {
                        vec4(-781.2783, -2041.6321, 8.8784, 309.1313),
                        vec4(-789.7836, -2023.9490, 8.8682, 50.6318),
                        vec4(-781.4107, -2029.8427, 8.8714, 52.3660),
                    },
                }
            },
        },
        higginsheli = {
            label = 'Higgins Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(-681.0, -1414.0, 5.0),
                    size = vec3(7.0, 32.0, 4.0),
                    rotation = 357.0,
                    spawn = {
                        vec4(-681.5031, -1407.8292, 5.0005, 88.2458),
                        vec4(-687.0870, -1406.6007, 5.0005, 93.7798),
                    },
                }
            },
        },
        beachp = {
            label = 'Beach Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(-1194.25, -1488.2, 4.0),
                    size = vec3(27.75, 15.3, 3.0),
                    rotation = 303.25,
                    spawn = {
                        vec4(-1184.7023, -1501.9591, 4.3797, 225.4667),
                        vec4(-1192.6836, -1495.0161, 4.3797, 220.1155),
                    },
                }
            },
        },
        spanishave = {
            label = 'Spanish Ave Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(-1137.0, -750.0, 20.0),
                    size = vec3(13.0, 28, 5.0),
                    rotation = 40.0,
                    spawn = {
                        vec4(-1139.9281, -751.2900, 19.3906, 106.7601),
                        vec4(-1162.5985, -733.8654, 20.1428, 124.6796),
                        vec4(-1150.9205, -751.0430, 19.1641, 272.5352),
                    },
                },
            },
        },
        lagunapi = {
            label = 'Laguna Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(376.0, 288.0, 103.0),
                    size = vec3(14.8, 16.7, 4.0),
                    rotation = 345.0,
                    spawn = {
                        vec4(364.7205, 287.9915, 103.3993, 164.9123),
                        vec4(375.8871, 289.1104, 103.2123, 76.6725),
                    },
                },
            },
        },
        littleseoul = {
            label = 'Little Seoul Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(-465.0, -619.0, 31.0),
                    size = vec3(19.0, 16.7, 4.0),
                    rotation = 0.0,
                    spawn = {
                        vec4(-457.1757, -625.2001, 30.1744, 357.6293),
                        vec4(-460.6246, -625.0508, 30.1744, 357.0523),
                        vec4(-464.2154, -625.1218, 30.1744, 3.6927),
                        vec4(-467.6683, -625.4925, 30.1744, 6.8963),
                        vec4(-467.6158, -613.3380, 30.1744, 174.5238),
                        vec4(-463.7601, -613.3512, 30.1744, 183.0605),
                        vec4(-460.4053, -612.7728, 30.1744, 187.6023),
                        vec4(-457.0157, -612.9185, 30.1744, 180.7053),
                        vec4(-470.8688, -612.8889, 30.1744, 173.0017),
                        vec4(-471.1577, -625.1149, 30.1744, 358.1643)

                    },
                },
            },
        },
        Mountzonahgarage = {
            label = 'Mount_zonah',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(-454.0, -373.0, 24.0),
                    size = vec3(39.0, 7.0, 3),
                    rotation = 20.0,
                    spawn = { vec4(-435.6641, -350.1329, 24.2304, 19.6602), },
                }
            },
        },

        davisgarage = {
            label = 'Davis Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(378.0, -1325.0, 44.0),
                    size = vec3(20.0, 7.0, 4.0),
                    rotation = 320.0,
                    spawn = {
                        vec4(377.7554, -1324.7577, 43.5539, 322.4542),
                        vec4(374.8894, -1322.5488, 43.5539, 317.8888),
                        vec4(380.5552, -1327.2811, 43.5539, 315.1908),
                    },

                },
            },
        },
        themotorhotel = {
            label = 'The Motor Hotel Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(1123.0, 2653.5, 38.0),
                    size = vec3(21.5, 17.0, 3.5),
                    rotation = 0.0,
                    spawn = {
                        vec4(1132.8129, 2667.4290, 38.0098, 178.1401),
                        vec4(1122.6141, 2665.2244, 38.0197, 186.2808),
                    },
                }
            },
        },
        liqourparking = {
            label = 'Liqour Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(893.0, 3651.0, 33.0),
                    size = vec3(18.0, 14.0, 3.0),
                    rotation = 1.5,
                    spawn = {
                        vec4(890.9763, 3657.6270, 32.8192, 193.7995),
                        vec4(892.0816, 3648.5688, 32.8115, 187.8626),
                    },
                }
            },
        },
        haanparking = {
            label = 'Bell Farms Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(-84.0, 6348.0, 31.0),
                    size = vec3(17.0, 18.0, 3.0),
                    rotation = 315.0,
                    spawn = {
                        vec4(-89.6167, 6346.4565, 31.4904, 234.6763),
                        vec4(-90.5494, 6336.1313, 31.4903, 221.1751),
                    },
                }
            },
        },
        grapeseed = {
            label = 'Grapeseed  Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(1701.0, 4803.0, 42.0),
                    size = vec3(19.0, 13.0, 4.0),
                    rotation = 0.0,
                    spawn = {
                        vec4(1692.3512, 4807.9956, 40.8260, 185.8825),
                        vec4(1700.1886, 4807.8018, 40.8411, 174.7340),
                        vec4(1711.5250, 4807.1890, 40.8108, 182.5932),
                        vec4(1711.2186, 4798.9585, 40.8498, 342.1343)
                    },
                }
            },
        },
        chumash = {
            label = 'Moms Pie  Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(-3052.0, 602.0, 7.65),
                    size = vec3(8.0, 14.0, 3),
                    rotation = 20.0,
                    spawn = {
                        vec4(-3055.6277, 608.4603, 6.2146, 286.0397),
                        vec4(-3055.0144, 605.4692, 6.2380, 283.9541),
                        vec4(-3053.9807, 602.5053, 6.2935, 287.8851),
                        vec4(-3051.8689, 596.7481, 6.4506, 295.1924)
                    },
                }
            },
        },
        boatgaragepublic = {
            label = 'Boat Garage',
            vehicleType = VehicleType.SEA,
            accessPoints = {
                {
                    blip = {
                        name = 'SEA Parking',
                        sprite = 754,
                        color = 17,
                    },
                    coords = vec3(-801.0, -1512.0, 1.0),
                    size = vec3(11.0, 14.0, 4.0),
                    rotation = 20.0,
                    spawn = {
                        vec4(-796.8524, -1520.4103, -0.2150, 113.3803)
                    },
                }
            },
        },
        hangerpublic = {
            label = 'Hanger',
            vehicleType = VehicleType.AIR,
            accessPoints = {
                {
                    blip = {
                        name = 'AIR Parking',
                        sprite = 759,
                        color = 17,
                    },
                    coords = vec3(-1178.0, -2846.0, 14.0),
                    size = vec3(18, 18, 7),
                    rotation = 0.0,
                    spawn = {
                        vec4(-1177.5684, -2846.0796, 12.9457, 230.1150)
                    },
                }
            },
        },
        palominogarage = {
            label = 'Palomino Garage Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            accessPoints = {
                {
                    blip = {
                        name = 'Public Parking',
                        sprite = 357,
                        color = 17,
                    },
                    coords = vec3(-1071.0, -1251.0, 6.0),
                    size = vec3(8.0, 18.0, 5.0),
                    rotation = 35.0,
                    spawn = {
                        vec4(-1074.2648, -1244.8062, 4.4094, 114.0756),
                        vec4(-1071.4103, -1248.4171, 4.6227, 120.9175),
                        vec4(-1068.9756, -1252.0157, 4.7921, 128.7718),
                        vec4(-1065.9679, -1257.0919, 4.9725, 111.4340),
                        vec4(-1062.9602, -1260.6217, 4.0657, 128.9542),
                    },
                }
            },
        },


        --JOB GARAGES
        ambulancedavisair = {
            label = 'Davis Heli',
            vehicleType = VehicleType.AIR,

            skipGarageCheck = true,
            groups = { 'ambulance', 'police' },
            accessPoints = {
                {
                    blip = {
                        name = 'Davis Air Parking',
                        sprite = 759,
                        color = 49,
                    },
                    coords = vec3(352.1857, -588.3117, 74.1617),
                    size = vec3(11.0, 11.0, 4.0),
                    rotation = 320.0,
                    spawn = {
                        vec4(352.1857, -588.3117, 74.1617, 234.8718),
                    },
                }
            },
        },
        ambulancedavisgarage = {
            label = 'Davis Parking',
            vehicleType = VehicleType.CAR,

            skipGarageCheck = true,
            groups = { 'ambulance', 'police' },
            accessPoints = {
                {
                    blip = {
                        name = 'Davis  Ambulance Parking',
                        sprite = 357,
                        color = 49,
                    },
                    coords = vec3(294.0327, -608.7101, 42.9692),
                    size = vec3(10.0, 19.0, 2.3),
                    rotation = 320.0,
                    spawn = {
                        vec4(269.0603, -607.1410, 42.4449, 96.7115),
                        vec4(280.5913, -606.0319, 42.8200, 95.5757),
                        vec4(288.9612, -595.5012, 42.9037, 164.3455),
                    },
                }
            },
        },
        policedavisgarage = {
            label = 'Davis Parking',
            vehicleType = VehicleType.CAR,

            skipGarageCheck = true,
            groups = { 'ambulance', 'police' },
            accessPoints = {
                {
                    blip = {

                        name = 'Davis  Police Parking',
                        sprite = 357,
                        color = 49,
                    },
                    coords = vec3(388.0, -1450.0, 29.0),
                    size = vec3(6.0, 13.0, 4.0),
                    rotation = 300.0,
                    spawn = {
                        vec4(387.8469, -1449.8572, 29.3631, 30.7115),
                        vec4(391.3205, -1447.6555, 29.3672, 33.9871),
                        vec4(383.8768, -1452.4327, 29.3577, 27.3254),
                    },
                }
            },
        },
        policedavisair = {
            label = 'Davis Heli',
            vehicleType = VehicleType.AIR,

            skipGarageCheck = true,
            groups = { 'ambulance', 'police' },
            accessPoints = {
                {
                    blip = {

                        name = 'Davis  Police Heli',
                        sprite = 357,
                        color = 49,
                    },
                    coords = vec3(299.3371, -1453.3258, 46.5089),
                    size = vec3(11.0, 11.0, 4.0),
                    rotation = 320.0,
                    spawn = {
                        vec4(299.3371, -1453.3258, 46.5089, 143.4989),
                    },
                }
            },
        },
        sandypolice = {
            label = 'Sandy Police',
            vehicleType = VehicleType.CAR,

            skipGarageCheck = true,
            groups = { 'ambulance', 'police' },
            accessPoints = {
                {
                    blip = {

                        name = 'Sandy Police Parking',
                        sprite = 357,
                        color = 49,
                    },
                    coords = vec3(1889.0, 3709.0, 33.0),
                    size = vec3(12.0, 19.0, 4.0),
                    rotation = 32.0,
                    spawn = {
                        vec4(1888.2471, 3716.6150, 31.8474, 123.3104),
                        vec4(1890.9677, 3711.9580, 31.8381, 130.1015),
                        vec4(1894.6586, 3706.5215, 31.8286, 115.0229),
                        vec4(1885.2788, 3720.3887, 31.8594, 123.3979),
                    },
                }
            },
        },
        sandyambulance = {
            label = 'Sandy Ambulance',
            vehicleType = VehicleType.CAR,

            skipGarageCheck = true,
            groups = { 'ambulance', 'police' },
            accessPoints = {
                {
                    blip = {

                        name = 'Sandy EMS Parking',
                        sprite = 357,
                        color = 49,
                    },
                    coords = vec3(1889.0, 3709.0, 33.0),
                    size = vec3(12.0, 19.0, 4.0),
                    rotation = 32.0,
                    spawn = {
                        vec4(1888.2471, 3716.6150, 31.8474, 123.3104),
                        vec4(1890.9677, 3711.9580, 31.8381, 130.1015),
                        vec4(1894.6586, 3706.5215, 31.8286, 115.0229),
                        vec4(1885.2788, 3720.3887, 31.8594, 123.3979),
                    },
                }
            },
        },
        mountambulance = {
            label = 'Mount Zonah Parking',
            vehicleType = VehicleType.CAR,

            skipGarageCheck = true,
            groups = { 'ambulance', 'police' },
            accessPoints = {
                {
                    blip = {

                        name = 'Mount EMS Parking',
                        sprite = 357,
                        color = 49,
                    },
                    coords = vec3(-454.0, -340.0, 34.4),
                    size = vec3(5.0, 19.0, 2.3),
                    rotation = 353.0,
                    spawn = {
                        vec4(-466.2974, -331.1442, 34.3634, 0.8889),
                        vec4(-467.6121, -338.0333, 34.3709, 353.3223),
                        vec4(-477.8462, -333.2939, 34.3802, 165.3954),
                        vec4(-479.2441, -343.8840, 34.3889, 169.8400)
                    },
                }
            },
        },
        -- mountzonahpd = {
        --     label = 'Mount Zonah Parking',

        --     vehicleType = VehicleType.CAR,
        --     groups = { 'ambulance', 'police' },
        --     accessPoints = {
        --         {
        --             coords = vec3(-454.0, -340.0, 34.4),
        --             size = vec3(5.0, 19.0, 2.3),
        --             rotation = 353.0,
        --             spawn = {
        --                 vec4(-466.2974, -331.1442, 34.3634, 0.8889),
        --                 vec4(-467.6121, -338.0333, 34.3709, 353.3223),
        --                 vec4(-477.8462, -333.2939, 34.3802, 165.3954),
        --                 vec4(-479.2441, -343.8840, 34.3889, 169.8400)
        --             },
        --         }
        --     },
        -- },
        mountairambulance = {
            label = 'Mount Zonah Helipad',

            vehicleType = VehicleType.AIR,
            skipGarageCheck = true,
            groups = { 'ambulance', 'police' },
            accessPoints = {
                {
                    blip = {

                        name = 'Mount AIR Parking',
                        sprite = 759,
                        color = 49,
                    },
                    coords = vec3(-452.0, -303.0, 78.0),
                    size = vec3(12.0, 34.0, 3),
                    rotation = 20.0,
                    spawn = {
                        vec4(-456.2930, -291.2563, 77.1680, 21.6747),
                        vec4(-447.4671, -312.5009, 77.1680, 203.9989)
                    },
                }
            },
        },
        mrpdairpolice = {
            label = 'MRPD Helipad',
            vehicleType = VehicleType.AIR,
            skipGarageCheck = true,
            groups = { 'ambulance', 'police' },
            accessPoints = {
                {
                    blip = {

                        name = 'Mount AIR Parking',
                        sprite = 759,
                        color = 49,
                    },
                    coords = vec3(450.7018, -1014.6760, 42.8420),
                    size = vec3(15.0, 10.0, 5),
                    rotation = 0.0,
                    spawn = {
                        vec4(450.5816, -1014.7515, 42.8420, 90.7992)
                    },
                }
            },
        },
        mrpdseapolice = {
            label = 'MRPD Boat Garage',
            vehicleType = VehicleType.SEA,
            skipGarageCheck = true,
            groups = { 'ambulance', 'police' },

            accessPoints = {
                {
                    blip = {

                        name = 'Mount SEA Parking',
                        sprite = 754,
                        color = 49,
                    },
                    coords = vec3(-719.0, -1330.0, 2.0),
                    size = vec3(23.0, 8.0, 4.0),
                    rotation = 230.0,
                    spawn = {
                        vec4(-710.1959, -1333.8750, -0.1490, 136.4781)
                    },
                }
            },
        },
        mrpdpolice = {
            label = 'MRPD Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            groups = { 'ambulance', 'police' },

            accessPoints = {
                {
                    blip = {

                        name = 'MRPD Parking',
                        sprite = 357,
                        color = 49,
                    },
                    coords = vec3(449.7971, -1007.7905, 25.9290),
                    size = vec3(20.0, 12.0, 4),
                    rotation = 0.0,
                    spawn = {
                        vec4(456.5207, -1015.1541, 25.9291, 16.9019),
                        vec4(450.2746, -1015.7361, 25.9290, 5.8939),
                        vec4(444.1542, -1015.7319, 25.9291, 359.6041),
                        vec4(450.3229, -1002.6445, 25.9291, 178.3813)
                    },
                }
            },
        },
        mrpdbackpolice = {
            label = 'MRPD Backside Parking',
            vehicleType = VehicleType.CAR,
            skipGarageCheck = true,
            groups = { 'ambulance', 'police' },

            accessPoints = {
                {
                    blip = {

                        name = 'MRPD Backside Parking',
                        sprite = 357,
                        color = 49,
                    },
                    coords = vec3(479.1460, -977.5444, 27.5160),
                    size = vec3(20.0, 12.0, 4),
                    rotation = 0.0,
                    spawn = {
                        vec4(477.3546, -970.1987, 27.4539, 271.6501),
                        vec4(477.5836, -975.3371, 27.5300, 271.5464),
                        vec4(478.6505, -980.3674, 27.5790, 282.2119),
                        vec4(479.4920, -985.3347, 27.6421, 273.5139)
                    },
                }
            },
        },
        -- mrpdems = {
        --     label = 'MRPD Parking',
        --     vehicleType = VehicleType.CAR,
        --     groups = { 'ambulance', 'police' },

        --     accessPoints = {
        --         {
        --             coords = vec3(436.0, -979.0, 26.0),
        --             size = vec3(20.0, 12.0, 4),
        --             rotation = 0.0,
        --             spawn = {
        --                 vec4(425.4720, -979.1024, 24.6998, 274.8780),
        --                 vec4(425.9496, -983.4296, 24.6998, 273.4157),
        --                 vec4(425.2763, -991.5237, 24.6998, 267.6747),
        --                 vec4(425.2459, -996.8804, 24.6998, 268.6359)
        --             },
        --         }
        --     },
        -- },
        
        paletopolice = {
            label = 'Paleto Police',
            vehicleType = VehicleType.CAR,

            skipGarageCheck = true,
            groups = { 'ambulance', 'police' },
            accessPoints = {
                {
                    blip = {

                        name = 'Paleto  Police Parking',
                        sprite = 357,
                        color = 49,
                    },
                    coords = vec3(-475.0, 6032.0, 32.1),
                    size = vec3(8.0, 29, 4),
                    rotation = 316.5,
                    spawn = { vec4(-475.8058, 6031.2627, 31.3404, 226.7063), },
                }
            },
        },
        paletoairpolice = {
            label = 'Paleto Police',
            vehicleType = VehicleType.AIR,

            skipGarageCheck = true,
            groups = { 'ambulance', 'police' },
            accessPoints = {
                {
                    blip = {

                        name = 'Paleto  Helipad',
                        sprite = 759,
                        color = 49,
                    },
                    name = "paleto helipad",
                    coords = vec3(-475.0, 5988.0, 32.0),
                    size = vec3(13.0, 11.0, 6.0),
                    rotation = 315.0,
                    spawn = { vec4(-475.1343, 5988.3354, 30.3365, 326.7242), },
                }
            },
        },
        sandyairpolice = {
            label = 'Sandy Helipad',
            vehicleType = VehicleType.AIR,

            skipGarageCheck = true,
            groups = { 'ambulance', 'police' },
            accessPoints = {
                {
                    blip = {
                        name = 'Sandy Air Parking',
                        sprite = 759,
                        color = 49,
                    },
                    coords = vec3(1855.0, 3641.0, 35.0),
                    size = vec3(19.5, 34.5, 6.0),
                    rotation = 295.0,
                    spawn = {
                        vec4(1865.3448, 3647.6675, 34.5987, 109.7659),
                    },
                }
            },
        },
        sandyairems = {
            label = 'Sandy Helipad',
            vehicleType = VehicleType.AIR,
            skipGarageCheck = true,
            groups = { 'ambulance', 'police' },

            accessPoints = {
                {
                    blip = {
                        name = 'Sandy Air Parking',
                        sprite = 759,
                        color = 49,
                    },
                    coords = vec3(1855.0, 3641.0, 35.0),
                    size = vec3(19.5, 34.5, 6.0),
                    rotation = 295.0,
                    spawn = {
                        vec4(1843.4922, 3636.0222, 34.6376, 350.9908),
                    },
                }
            },
        },
        airdepot = {
            label = 'Air Depot',
            type = GarageType.DEPOT,
            states = { VehicleState.IMPOUNDED },

            vehicleType = VehicleType.AIR,
            accessPoints = {
                {
                    blip = {
                        name = 'Air Depot',
                        sprite = 759,
                        color = 18,
                    },
                    coords = vec3(-1145.0, -2864.0, 14.0),
                    size = vec3(15.0, 15.0, 4.0),
                    rotation = 0.0,
                    spawn = { vec4(-1145.0, -2864.0, 14.0, 330.32), },
                }
            },
        },
        seadepot = {
            label = 'LSYMC Depot',
            type = GarageType.DEPOT,
            states = { VehicleState.IMPOUNDED },
            vehicleType = VehicleType.SEA,
            accessPoints = {
                {
                    blip = {
                        name = 'LSYMC Depot',
                        sprite = 754,
                        color = 18,
                    },
                    coords = vec3(-807.0, -1497.0, 2.0),
                    size = vec3(9.0, 11.0, 5.0),
                    rotation = 290.0,
                    spawn = { vec4(-710.1959, -1333.8750, -0.1490, 136.4781), },
                }
            },
        },
        impoundlot = {
            label = 'City Impound Lot',
            type = GarageType.DEPOT,
            skipGarageCheck = true,
            states = { VehicleState.IMPOUNDED },
            vehicleType = VehicleType.CAR,
            accessPoints = {
                {
                    blip = {
                        name = 'City Impound Lot',
                        sprite = 68,
                        color = 18,
                    },
                    coords = vec3(-219.0, -1361.0, 31.0),
                    size = vec3(12.0, 11.0, 4),
                    rotation = 295.0,
                    spawn = { vec4(-215.7386, -1355.3566, 30.2607, 215.3165),
                        vec4(-221.6051, -1358.5319, 30.2586, 210.2719) },

                }
            },
        },
    },

}
