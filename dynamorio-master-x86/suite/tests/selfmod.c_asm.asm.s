






























































































































































































































































































































































































































































































































































































































   

























































  



  





















   




  




































































































































































































































































































































































































































































































































































































































































































































































































.686 
.XMM 
.MODEL flat, c 
ASSUME fs:_DATA 
.CODE

EXTERN cross_page_check:PROC
EXTERN print_int:PROC
























_MYTEXT SEGMENT ALIGN(4096) READ EXECUTE SHARED ALIAS(".mytext")


    
ALIGN 4096
REPEAT (4080) 
 nop 
 ENDM


        sandbox_cross_page PROC

        nop 
PUBLIC sandbox_cross_page_no_ilt
sandbox_cross_page_no_ilt::
        mov      eax, dword ptr [ 1*4 + esp]
        mov      ecx, dword ptr [ 2*4 + esp]
        push     ebp
        push     edx
        push     edi  

        



        
        mov      [ecx + 0], al
        mov      [ecx + 1], al
        mov      [ecx + 2], al
        mov      [ecx + 3], al

        lea      edx, [immediate_addr_plus_four - 4]
        mov      dword ptr [edx], eax        

        
        mov      [ecx + 4], al
        mov      [ecx + 5], al
        mov      [ecx + 6], al
        mov      [ecx + 7], al

        mov      edx, 00h             
immediate_addr_plus_four::
        lea      eax, [cross_page_check]
         
 push edx 
 call eax 
 lea esp, [4*1 + esp]

        
        pop      edi
        pop      edx
        pop      ebp
        ret
        sandbox_cross_page ENDP



ALIGN 4096
REPEAT (4096 - 6) 
 nop 
 ENDM  


        sandbox_last_byte PROC

        




        jmp      last_byte_jmp          
last_byte_ret_zero:
        xor      eax, eax               
        ret                             

PUBLIC last_byte_jmp_no_ilt
last_byte_jmp_no_ilt::
last_byte_jmp:
        jmp      last_byte_ret_zero     
last_byte_ret_one:
        mov      eax, 01h
        ret
        sandbox_last_byte ENDP


ALIGN 16


        make_last_byte_selfmod PROC

        lea      eax, [last_byte_immed_plus_four - 4]
        mov      dword ptr [eax], 00h     
        mov      eax, 00h             
last_byte_immed_plus_four::
        ret
        make_last_byte_selfmod ENDP


ALIGN 4096


_MYTEXT ENDS



        sandbox_fault PROC

PUBLIC sandbox_fault_no_ilt
sandbox_fault_no_ilt::
        mov      eax, dword ptr [ 1*4 + esp]
        push     ebp
        push     edx
        push     edi  

        lea      edx, [fault_immediate_addr_plus_four - 4]
        mov      dword ptr [edx], eax        

        mov      edx, 00h             
fault_immediate_addr_plus_four::
        lea      eax, [print_int]
         
 push edx 
 call eax 
 lea esp, [4*1 + esp]

        mov      ecx, 07h
        mov      [ecx], eax              

        
        pop      edi
        pop      edx
        pop      ebp
        ret
        sandbox_fault ENDP




        sandbox_illegal_instr PROC

PUBLIC sandbox_illegal_no_ilt
sandbox_illegal_no_ilt::
        mov      eax, dword ptr [ 1*4 + esp]
        push     ebp
        push     edx
        push     edi  

        lea      edx, [illegal_immediate_addr_plus_four - 4]
        mov      dword ptr [edx], eax        

        mov      edx, 00h             
illegal_immediate_addr_plus_four::
        lea      eax, [print_int]
         
 push edx 
 call eax 
 lea esp, [4*1 + esp]

        
        mov      ecx, esp
        mov      byte ptr [ecx - 1], 1
        mov      byte ptr [ecx - 2], 2
        mov      byte ptr [ecx - 3], 3
        mov      byte ptr [ecx - 4], 4
        mov      byte ptr [ecx - 5], 5
        ud2                                  
        
        mov      byte ptr [ecx - 6], 6

        
        pop      edi
        pop      edx
        pop      ebp
        ret
        sandbox_illegal_instr ENDP




        sandbox_cti_tgt PROC

        
        lea      eax, [loop_target_end - 1]
        mov      byte ptr [eax], 04h     
        mov      ecx, 4
        loop     loop_orig_target
loop_target_end::
        ud2
loop_orig_target:
        ud2

        
        push     edi
        lea      edi, [loop_target_end2 - 1]
        mov      al, 4
        stosb    
        mov      ecx, 4
        loop     loop_orig_target2
loop_target_end2::
        ud2
loop_orig_target2:
        ud2
        pop      edi


        
        mov      eax, esp
        
        lea      esp, [loop_target_end3 + 3]
        push     00b0f0b04h    
        mov      ecx, 4
        loop     loop_orig_target3
loop_target_end3::
        ud2
loop_orig_target3:
        ud2
        mov      esp, eax


        ret
        sandbox_cti_tgt ENDP









        sandbox_direction_flag PROC

PUBLIC sandbox_direction_flag_no_ilt
sandbox_direction_flag_no_ilt::
        mov      eax, 01h
        lea      edx, [direction_flag_immediate_addr_plus_four - 4]
        mov      dword ptr [edx], eax        
        mov      edx, 00h             
direction_flag_immediate_addr_plus_four::

        std                                  
        jmp      direction_flag_afterstd     

direction_flag_afterstd:
        nop                                  
        cld                                  
        ret
sandbox_direction_flag ENDP


END



