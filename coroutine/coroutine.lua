local function fn()
    local tmp = {}
    for i=0,10000000 do
        tmp[i]=i
    end
    while true do
    coroutine.yield()
    end
end
c1=coroutine.create(fn)
c2=coroutine.create(fn)

local start=os.clock()
local count=50000000

for i=1,count do
 coroutine.resume(c1)
 coroutine.resume(c2)
end

print(4*count/(os.clock()-start))