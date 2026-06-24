; func_0208fb10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021023bc
        .extern func_0208e0e4
        .extern func_02093ec4
        .extern func_020943b0
        .global func_0208fb10
        .arm
func_0208fb10:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_0208e0e4
    ldr r1, _LIT0
    mov ip, r0
    ldr r0, [r1]
    mvn r1, #0x0
    cmp r0, r1
    beq .L_254
    cmp r4, #0x1c
    bls .L_254
    mov r1, r6
    mov r3, r4
    add r2, ip, r5
    bl func_02093ec4
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_254:
    mov r0, r6
    mov r2, r4
    add r1, ip, r5
    bl func_020943b0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021023bc
