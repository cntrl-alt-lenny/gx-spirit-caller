; func_02050140 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204d97c
        .extern func_0204e868
        .extern func_020acca0
        .global func_02050140
        .arm
func_02050140:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x21c
    mov fp, r2
    mov sl, #0x0
    str r1, [sp, #0x8]
    add r9, sp, #0xc
    add r5, sp, #0x1c
    mov r7, sl
    add r8, fp, #0x1
    mov r6, #0xa
    mvn r4, #0x0
.L_2c:
    mov r0, r9
    mov r1, r8
    mov r2, sl
    bl func_0204e868
    cmp r0, r4
    beq .L_64
    mov r0, r9
    mov r1, r7
    mov r2, r6
    bl func_020acca0
    str r0, [r5, sl, lsl #0x2]
    add sl, sl, #0x1
    cmp sl, #0x80
    blt .L_2c
.L_64:
    add r0, sp, #0x1c
    str r0, [sp]
    str sl, [sp, #0x4]
    ldrb r0, [fp]
    mov r2, #0x0
    ldr r1, [sp, #0x8]
    mov r3, r2
    bl func_0204d97c
    add sp, sp, #0x21c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
