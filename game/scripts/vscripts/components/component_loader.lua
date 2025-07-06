if ComponentLoader == nil then
    ComponentLoader = class({})
end

function ComponentLoader:init()
    if USE_CUSTOM_ROSHAN then
        require('components.roshan.init')
    end
    if USE_CUSTOM_TORMENTOR then
        require('components.tormentor.init')
    end
end
