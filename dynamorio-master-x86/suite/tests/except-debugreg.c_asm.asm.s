




































































































































































































































































































































































































   

























































  



  





















   




  



































































































































































































































































































































































































































































































































































































































































































































































































.686 
.XMM 
.MODEL flat, c 
ASSUME fs:_DATA 
.CODE





set_debug_register PROC

        int      3
        nop
        nop
        ret
set_debug_register ENDP





test_debug_register PROC

        xor      eax, eax
        
        mov      eax, 1
        
PUBLIC single_step_addr0
single_step_addr0::
        inc      eax
        nop
        inc      eax
        jmp      eaxEquals2
        ret
        
    eaxEquals2:
PUBLIC single_step_addr1
single_step_addr1::
        inc      eax
        nop
        ret
test_debug_register ENDP

END


