function fillFrind(){   
  const input = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]    
  const boxs = fillArray(input, 4)
  const packs = fillArray(boxs, 2)
  const friends = fillArray(packs,2,2)
  console.log(friends)
}

function fillArray(input, countIn, amountElement = 0){
  const output = []
  start = 0 
  while(start < input.length){
      end = start + countIn   
      output.push(input.slice(start, end))
      start = end
      if(output.length === amountElement){
          break
      }
  }
  return output
}

fillFrind()