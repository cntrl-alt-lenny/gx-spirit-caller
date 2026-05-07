; func_020b41c0: SVC #0x123456 with arg in r1, code 3 in r0. The SVC
; (formerly SWI) call dispatches to a debugger or kernel hook —
; #0x123456 is the standard "DebugBreak"-style identifier.
;
;     str lr, [sp, #-0x4]!
;     mov r1, r0                  ; r1 = caller arg
;     mov r0, #0x3                ; svc selector = 3
;     swi #0x123456
;     ldr pc, [sp], #0x4
;
; 5 ARM instructions, 0x14 bytes. `swi` is privileged; ships as `.s`.

        .text

        .global func_020b41c0
        .arm
func_020b41c0:
        str     lr, [sp, #-0x4]!
        mov     r1, r0
        mov     r0, #0x3
        swi     0x123456
        ldr     pc, [sp], #0x4
