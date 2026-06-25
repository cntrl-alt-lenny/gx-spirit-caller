; func_0208f698 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_021023bc
        .extern func_0208dd64
        .extern func_02093f3c
        .global func_0208f698
        .arm
func_0208f698:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_0208dd64
    ldr r1, _LIT0
    mov ip, r0
    ldr r0, [r1]
    mvn r1, #0x0
    cmp r0, r1
    beq .L_2a0
    cmp r4, #0x30
    bls .L_2a0
    mov r1, r6
    mov r3, r4
    add r2, ip, r5
    bl func_02093f3c
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_2a0:
    mov r0, r6
    mov r2, r4
    add r1, ip, r5
    bl Copy32
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021023bc
