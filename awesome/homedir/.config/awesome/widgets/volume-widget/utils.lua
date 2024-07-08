local utils = {}

function utils.extract_sinks_and_sources(pactl_output,default_sink,default_source)
    local sinks = {}
    local sources = {}
    local device
    local name
    local in_sink = false
    local in_source = false
    local in_device = false
    for line in pactl_output:gmatch("[^\r\n]+") do
        if string.match(line, 'Source #') then
            in_sink = false
            in_source = true
        end
        if string.match(line, 'Sink #') then
            in_sink = true
            in_source = false
        end

        if string.match(line, ' #') then
            in_device = true
            in_properties = false
            device = {
                id = line:match(' #(%d+)'),
            }
            if in_sink then
                table.insert(sinks, device)
            elseif in_source then
                table.insert(sources, device)
            end
            in_sink = false
            in_source = false
        end

        if string.match(line, 'Name:') then
            name = line:match(': (.+)')
            if in_sink and name == default_sink then
                is_default = true
            end
            if in_source and name == default_source then
                is_default = true
            end
        end

        if string.match(line, 'Description:') then
            device['description'] = line:match(': (.+)')
        end
    end

    return sinks, sources
end

return utils