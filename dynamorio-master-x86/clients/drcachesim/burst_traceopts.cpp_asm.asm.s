



































































































































































































































































































































































































































































































































   

























































  



  





















   




  



































































































































































































































































































































































































































































































































































































































































































































































































.686 
.XMM 
.MODEL flat, c 
ASSUME fs:_DATA 
.CODE


        test_disp_elision PROC


        mov      eax, esp
        mov      edx, dword ptr [eax + 8]
        add      eax, 00h 
        mov      edx, dword ptr [eax + 16]
        add      eax, 00h 
        mov      edx, dword ptr [eax + 32]
        ret






















        test_disp_elision ENDP



        test_base_elision PROC


        mov      eax, esp




mysym:
       
        mov      edx, dword ptr [eax + 8]
        mov      edx, dword ptr [esp + 64]
        mov      edx, dword ptr [eax + 16]
        mov      edx, dword ptr [eax + 32]
        
        cmovne   edx, dword ptr [eax + 32]
        jmp      newblock
newblock:
        
        mov      edx, dword ptr [esp + 8]
        push     eax
        mov      eax, esp
        mov      edx, dword ptr [eax + 8]
        mov      eax, dword ptr [eax]
        mov      edx, dword ptr [eax + 16]
        pop      eax
        ret































        test_base_elision ENDP


END


