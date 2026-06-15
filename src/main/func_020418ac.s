; func_020418ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe978
        .extern data_020fe990
        .extern func_02040cc0
        .extern func_02041470
        .extern func_020945f4
        .global func_020418ac
        .arm
func_020418ac:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r5, r0
    add r1, r5, #0x1000
    ldr r4, [r1, #0x14]
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    ldr r1, _LIT0
    mov r2, #0x20
    add r1, r5, r1
    bl func_02040cc0
    ldr r1, _LIT1
    mov r0, r5
    add r1, r5, r1
    bl func_02041470
    ldr r1, _LIT2
    mov r0, r5
    add r1, r5, r1
    bl func_02041470
    add r0, r5, #0x1000
    ldr r1, [r0, #0x9c8]
    cmp r1, #0x0
    beq .L_3f4
    ldr r0, _LIT3
    mov r2, #0x0
    blx r4
    add r0, r5, #0x1000
    mov r1, #0x0
    str r1, [r0, #0x9c8]
.L_3f4:
    add r0, r5, #0x1000
    ldr r1, [r0, #0x9cc]
    cmp r1, #0x0
    beq .L_41c
    ldr r0, _LIT4
    mov r2, #0x0
    blx r4
    add r0, r5, #0x1000
    mov r1, #0x0
    str r1, [r0, #0x9cc]
.L_41c:
    ldr r2, _LIT5
    mov r0, r5
    mov r1, #0x0
    bl func_020945f4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x00001a34
_LIT1: .word 0x00001a04
_LIT2: .word 0x000019f4
_LIT3: .word data_020fe978
_LIT4: .word data_020fe990
_LIT5: .word 0x00001c10
