#add arrays serial

function addS(a,b)
z = [a[n]+b[n] for n in 1:size(a,1)]
return z
end

#add arrays parallel (Attempt 1)

@everywhere using DistributedArrays
function addP(a,b)
z = @DArray [a[i]+b[i] for i in 1:size(a,1)]
return z
end

#add arrays parallel (Attempt 2)
#in the console

addprocs(4)
a = rand(15000000);
b = rand(15000000);
z = SharedArray(Float64,15000000);
@parallel for i = 1:15000000
  z[i] = a[i]+b[i]
  end
