; func_0200b2d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .global func_0200b2d8
        .arm
func_0200b2d8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    movs r7, r3
    mov sl, r0
    mov r9, r1
    mov r8, r2
    mov r6, #0x0
    beq .L_104
    mov r5, r6
    mov fp, #0xc
    mvn r4, #0x0
.L_cc:
    mov r0, r5
    mov r1, sl
    mov r2, fp
    bl Fill32
    ldr r1, [r9, r6, lsl #0x3]
    add r0, r9, r6, lsl #0x3
    add r1, r8, r1
    str r1, [sl]
    ldr r0, [r0, #0x4]
    add r6, r6, #0x1
    stmib sl, {r0, r4}
    cmp r6, r7
    add sl, sl, #0xc
    bcc .L_cc
.L_104:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
