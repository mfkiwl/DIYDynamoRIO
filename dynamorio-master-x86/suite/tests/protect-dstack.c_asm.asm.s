







































































































































































































































































































































































































































































































































































   

























































  



  





















   




  



































































































































































































































































































































































































































































































































































































































































































































































































.686 
.XMM 
.MODEL flat, c 
ASSUME fs:_DATA 
.CODE


        clear_eflags PROC

        
        push     0
        popf
        ret
        clear_eflags ENDP




        evil_copy PROC

       
        mov      eax, dword ptr [ 3*4 + esp]
        mov      ecx, dword ptr [ 1*4 + esp]
        mov      edx, dword ptr [ 2*4 + esp]
        push edi 

        
        xchg     edx, ecx 
        mov      edi, edx
        rep stosd
        add      esp, 0 
        pop      edi
        ret
        evil_copy ENDP

END


