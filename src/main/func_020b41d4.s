; func_020b41d4: SVC #0x123456 with arg-1 = 0 and code 7. Sibling of
; func_020b41c0 with different selector + zero arg.
;
;     str lr, [sp, #-0x4]!
;     mov r1, #0x0
;     mov r0, #0x7
;     swi #0x123456
;     ldr pc, [sp], #0x4
;
; 5 ARM instructions, 0x14 bytes.

        .text

        .global func_020b41d4
        .arm
func_020b41d4:
        str     lr, [sp, #-0x4]!
        mov     r1, #0x0
        mov     r0, #0x7
        swi     0x123456
        ldr     pc, [sp], #0x4
