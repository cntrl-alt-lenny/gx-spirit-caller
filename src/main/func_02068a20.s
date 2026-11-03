; func_02068a20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3754
        .extern data_02101d5c
        .extern func_02068578
        .extern func_02068ab4
        .extern func_020aaf40
        .extern func_020ace00
        .global func_02068a20
        .arm
func_02068a20:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    ldr r1, _LIT0
    mov r0, r5
    mov r4, r2
    bl func_020aaf40
    cmp r0, #0x0
    bne .L_30
    mov r0, r6
    bl func_02068578
    ldmia sp!, {r4, r5, r6, pc}
.L_30:
    mov r0, r6
    mov r1, r5
    mov r2, #0x0
    bl func_02068ab4
    cmp r0, #0x0
    beq .L_7c
    ldrb r2, [r0]
    cmp r2, #0x0
    blt .L_5c
    cmp r2, #0x80
    blt .L_64
.L_5c:
    mov r1, #0x0
    b .L_74
.L_64:
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1
    ldrh r1, [r1, r2]
    and r1, r1, #0x8
.L_74:
    cmp r1, #0x0
    bne .L_84
.L_7c:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
.L_84:
    bl func_020ace00
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02101d5c+0x4
_LIT1: .word data_020c3754
