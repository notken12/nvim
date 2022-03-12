local tree ={}
tree.open = function ()
   require'bufferline.state'.set_offset(31, 'Explorer')
   --require'nerdtree'.open()
end

tree.close = function ()
   require'bufferline.state'.set_offset(0)
   require'nerdtree'.close()
end

require'bufferline.state'.set_offset(31, 'Explorer')

return tree 
