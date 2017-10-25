#!/bin/bash
echo "Starting"
 
TestFunction(){
    for(( i=1;i<10;i++ )) 
    do
        if [ $i -eq 7 ]; then
            break      # <- abort loop
            #continue  # <- skip just this iteration, but continue loop
            #return    # <- abort code, and continue in caller scope
            #exit      # <- abort code at caller scope
        fi
        echo "fshing fish $i"
    done
   
}
 
TestFunction
 
echo "Script done!"
