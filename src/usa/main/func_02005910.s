; func_02005910 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208c7c8
        .extern func_0208c7e4
        .extern func_0208cd60
        .extern func_0208cd88
        .extern func_0208cdb0
        .extern func_0208cdc4
        .extern func_0208cdd8
        .extern func_0208cdec
        .extern func_0208ce00
        .extern func_0208ce14
        .extern func_0208ce38
        .extern func_0208ce5c
        .extern func_0208ce70
        .global func_02005910
        .arm
func_02005910:
    stmdb sp!, {r3, lr}
    bl func_0208ce70
    bl func_0208cdc4
    bl func_0208ce5c
    bl func_0208cdb0
    bl func_0208ce38
    bl func_0208ce14
    bl func_0208cd88
    bl func_0208cd60
    bl func_0208ce00
    bl func_0208cdec
    bl func_0208cdd8
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r1
    bl func_0208c7e4
    mov r0, #0x0
    bl func_0208c7c8
    mov r2, #0x0
    ldr r1, _LIT0
    ldr r0, _LIT1
    str r2, [r1]
    str r2, [r1, #0x4]
    str r2, [r1, #0x8]
    str r2, [r1, #0xc]
    add r1, r1, #0x1000
    str r2, [r1]
    str r2, [r0]
    str r2, [r0, #0x4]
    str r2, [r0, #0x8]
    ldmia sp!, {r3, pc}
_LIT0: .word 0x04000010
_LIT1: .word 0x04001014
