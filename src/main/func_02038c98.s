; func_02038c98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b330
        .extern func_0207d318
        .extern func_0207d458
        .extern func_02089024
        .extern func_02096060
        .extern func_020960ac
        .global func_02038c98
        .arm
func_02038c98:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    bl func_0207d318
    cmp r4, #0x0
    beq .L_7c
    ldrb r0, [r5, #0x1e]
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_7c
    b .L_7c
    b .L_48
    b .L_64
    b .L_7c
    b .L_7c
    b .L_7c
    b .L_7c
    b .L_64
.L_48:
    ldr r0, [r5, #0x14]
    bl func_02089024
    cmp r0, #0x0
    beq .L_7c
    add r0, r5, #0x20
    bl func_020960ac
    b .L_7c
.L_64:
    ldr r0, [r5, #0x14]
    bl func_02089024
    cmp r0, #0x0
    beq .L_7c
    add r0, r5, #0x20
    bl func_02096060
.L_7c:
    ldr r0, _LIT0
    mov r1, r5
    ldr r0, [r0]
    bl func_0207d458
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_0219b330
