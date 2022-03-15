local tree ={}
tree.open = function ()
   -- require'bufferline.state'.set_offset(30, "Explorer")
   -- require'nvim-tree'.open()
end

tree.close = function ()
   require'bufferline.state'.set_offset(0)
   require'nvim-tree'.close()
end

return tree 
