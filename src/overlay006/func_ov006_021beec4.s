; func_ov006_021beec4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4728
        .extern func_02001d0c
        .extern func_02001e94
        .extern func_0208dd9c
        .extern func_0208df94
        .extern func_0208ff84
        .extern func_02094504
        .global func_ov006_021beec4
        .arm
func_ov006_021beec4:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    mov r4, r0
    ldrh r2, [r3]
    mov r1, #0x30000
    bic r0, r2, #0x3
    orr r0, r0, #0x2
    strh r0, [r3]
    ldrh r0, [r3]
    and r0, r0, #0x43
    orr r0, r0, #0x218
    orr r0, r0, #0x400
    strh r0, [r3]
    str r1, [r3, #0xe]
    bl func_0208df94
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x640
    bl func_02094504
    add r0, r4, #0x4
    mov r1, #0x20
    mov r2, #0x19
    bl func_02001d0c
    bl func_0208df94
    mov r1, r0
    add r0, r4, #0x4
    mov r2, #0x2
    mov r3, #0x1
    bl func_02001e94
    bl func_0208dd9c
    add r1, r0, #0x40
    mov r0, #0x0
    mov r2, #0x6400
    bl func_02094504
    mov r1, #0x20
    ldr r0, _LIT1
    mov r2, r1
    bl func_0208ff84
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0400100e
_LIT1: .word data_020b4728
