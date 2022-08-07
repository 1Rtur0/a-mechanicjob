Config = {}

Config.Align = 'bottom-right'
Config.HabilitarProps = true

Config.Mecanicos = {
    ['Mirror Park'] = {
        
        Job = 'mechanic',
        Society_Name = 'society_mechanic',
        Armario = vec3(1160.42, -782.36, 57.61),
        Boss = vec3(1156.03, -779.96, 57.61),
        Cloakrooms = vec3(1132.31, -778.57, 57.61),
        Props = vec3(1148.22, -785.79, 57.6),

        -- Vehiculos
        SpawnCars = vec3(1127.68, -790.66, 57.6),
        DeleteCars = vec3(1147.04, -799.53, 57.58),
        SpawnVehicle = vec3(1147.04, -799.53, 57.58),
        Heading = 88.31,
        Vehiculos = {
            {label = 'Camión de remolque', model = 'towtruck'},
            {label = 'Cama plana', model = 'flatbed'}
        }

    }
}