; func_020009fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020009fc
        .arm
func_020009fc:
    ldr r0, _LIT0
    ldr r1, [r0]
    ldr r2, [r0, #0x4]
    ldr r3, [r0, #0x8]
.L_bc:
    cmp r1, r2
    beq .L_11c
    ldr r5, [r1], #0x4
    ldr r7, [r1], #0x4
    add r6, r5, r7
    mov r4, r5
.L_d4:
    cmp r4, r6
    ldrmi r7, [r3], #0x4
    strmi r7, [r4], #0x4
    bmi .L_d4
    ldr r7, [r1], #0x4
    add r6, r4, r7
    mov r7, #0x0
.L_f0:
    cmp r4, r6
    strcc r7, [r4], #0x4
    bcc .L_f0
    bic r4, r5, #0x1f
.L_100:
    mcr p15, 0, r7, c7, c10, 4
    mcr p15, 0, r4, c7, c5, 1
    mcr p15, 0, r4, c7, c14, 1
    add r4, r4, #0x20
    cmp r4, r6
    blt .L_100
    b .L_bc
.L_11c:
    b .L_FUNCEND
_LIT0: .word 0x02000b68
.L_FUNCEND:
