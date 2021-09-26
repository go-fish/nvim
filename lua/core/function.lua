local cmd = vim.cmd

function bdelete()
    print(vim.inspect("132423"))
    cmd("bprevious")
    cmd("bd#")
end
