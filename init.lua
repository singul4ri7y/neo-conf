-- A really gross hack I know; just want to keep all 
-- the config files in a single directory under '.config'.
-- Makes it much more clean to manage config files.
package.path = package.path .. ';/home/singul4ri7y/.config/singul4ri7y/nvim/?.lua'


-- Load the config
require 'neovim'
