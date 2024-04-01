local status_ok, _ = pcall(require, 'lspconfig')

if not status_ok then
    return
end

require 'singul4ri7y.lsp.mason'
require 'singul4ri7y.lsp.handler' .setup()
