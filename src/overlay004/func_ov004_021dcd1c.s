; func_ov004_021dcd1c - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).
; Thumb gap-object mode (brief 406 stretch).

        .text
        .extern data_ov004_0229161c
        .extern func_ov004_021dbe78
        .global func_ov004_021dcd1c
        .thumb
func_ov004_021dcd1c:
    push {r4, r5, r6, lr}
    mov r4, #0x0
    add r5, r4, #0x0
    add r6, r4, #0x0
    ldr r3, _LIT0
.L_a:
    ldrb r2, [r3, #0x0]
    cmp r2, #0x0
    beq .L_14
    mov r5, #0x1
    b .L_1c
.L_14:
    add r3, r3, #0x1
    add r6, r6, #0x1
    cmp r6, #0x6
    blt .L_a
.L_1c:
    cmp r5, #0x0
    beq .L_30
    ldr r0, _LIT0
    mov r2, #0x6
    bl func_ov004_021dbe78
    cmp r0, #0x0
    beq .L_38
    mov r4, #0x1
    b .L_38
.L_30:
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_38
    mov r4, #0x2
.L_38:
    add r0, r4, #0x0
    pop {r4, r5, r6}
    pop {r3}
    bx r3
    .align 2
_LIT0: .word data_ov004_0229161c
_LIT1: .word 0x00001000
