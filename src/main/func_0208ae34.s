; func_0208ae34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02092904
        .global func_0208ae34
        .arm
func_0208ae34:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r4, [sp, #0x20]
    mov r8, r0
    ldr lr, [r4, #0x8]
    mov r7, r1
    mov r6, r2
    mov r5, r3
    cmp lr, #0x0
    beq .L_34
    ldr ip, [r4, #0xc]
    str ip, [sp]
    blx lr
.L_34:
    ldr ip, [r4, #0x4]
    mov r0, r8
    mov r1, r7
    mov r2, r6
    mov r3, r4
    blx ip
    ldr ip, [r4, #0x10]
    cmp ip, #0x0
    beq .L_74
    ldr r4, [r4, #0x14]
    mov r0, r8
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    blx ip
.L_74:
    mov r0, r8
    mov r1, r6
    bl func_02092904
    mov r0, r7
    mov r1, r6
    bl func_02092904
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
