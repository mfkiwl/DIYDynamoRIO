





































































































































































































































































































































































   

























































  



  





















   




  



































































































































































































































































































































































































































































































































































































































































































































































































.686 
.XMM 
.MODEL flat, c 
ASSUME fs:_DATA 
.CODE





foo PROC


        mov      eax, 01h
        lea      edx, [sandbox_immediate_addr_plus_four - 4]
        mov      dword ptr [edx], eax        
        mov      edx, 00h             
sandbox_immediate_addr_plus_four::
        mov      eax, edx

        pushfd

        or       dword ptr [esp], 0100h

        popfd

        jmp      single_step
        ret
    single_step:
PUBLIC single_step_addr
single_step_addr::
        inc      eax
        ret
foo ENDP

END


