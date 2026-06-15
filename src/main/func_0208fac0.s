; func_0208fac0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210249c
        .extern func_0208e0a0
        .extern func_02093fb8
        .extern func_020944a4
        .global func_0208fac0
        .arm
func_0208fac0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_0208e0a0
    ldr r1, _LIT0
    mov ip, r0
    ldr r0, [r1]
    mvn r1, #0x0
    cmp r0, r1
    beq .L_780
    cmp r4, #0x1c
    bls .L_780
    mov r1, r6
    mov r3, r4
    add r2, ip, r5
    bl func_02093fb8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_780:
    mov r0, r6
    mov r2, r4
    add r1, ip, r5
    bl func_020944a4
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_0210249c
