local loopOne = coroutine.create(function()
    while true do
      print("Nathan Will Be Successful")
      task.wait(.01)
    end
end)

coroutine.resume(loopOne)

while true do  
   print("Nathan Will Breakthrough")
   task.wait(.01)
end