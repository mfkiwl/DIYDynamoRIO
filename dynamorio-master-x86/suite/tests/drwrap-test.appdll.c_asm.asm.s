















































































































































































































































































































































































































































































































































































































































   

























































  



  





















   




  



































































































































































































































































































































































































































































































































































































































































































































































































.686 
.XMM 
.MODEL flat, c 
ASSUME fs:_DATA 
.CODE









EXTERN level2:PROC



        makes_tailcall PROC EXPORT







        jmp     level2


        ret 

        makes_tailcall ENDP



EXTERN print_from_asm:PROC

        tailcall_test2 PROC EXPORT


        sub esp, 16 - 4






        mov      eax, 01h
         
 push eax 
 call print_from_asm 
 lea esp, [4*1 + esp]

        add esp, 16 - 4






        jmp     tailcall_tail
        tailcall_test2 ENDP




        tailcall_tail PROC EXPORT


        sub esp, 16 - 4






        mov      eax, 07h
         
 push eax 
 call print_from_asm 
 lea esp, [4*1 + esp]

        add esp, 16 - 4
        ret







        tailcall_tail ENDP

END


