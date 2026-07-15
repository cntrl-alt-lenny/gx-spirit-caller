; func_ov022_021ab250 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov022_021ab9c0
        .extern data_ov022_021aba08
        .extern func_0208c79c
        .extern func_020b377c
        .global func_ov022_021ab250
        .arm
func_ov022_021ab250:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r1, [r0, #0x54]
    subs r1, r1, #0x1000
    str r1, [r0, #0x54]
    movmi r0, #0x0
    strmi r0, [r4, #0xc]
    ldr r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    mov r0, r0, lsl #0x4
    rsb r0, r0, #0x0
    bl func_020b377c
    mvn r1, #0xf
    sub r5, r1, r0
    ldr r0, _LIT2
    mov r1, r5
    bl func_0208c79c
    ldr r0, _LIT3
    mov r1, r5
    bl func_0208c79c
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r2, #0x0
    ldr r0, _LIT2
    sub r1, r2, #0x10
    str r2, [r4, #0xc]
    str r2, [r4, #0x8]
    bl func_0208c79c
    ldr r0, _LIT3
    mvn r1, #0xf
    bl func_0208c79c
    mov r1, #0x4000000
    ldr r0, [r1]
    add r2, r1, #0x1000
    bic r0, r0, #0x1f00
    str r0, [r1]
    ldr r1, [r2]
    mov r0, #0x1
    bic r1, r1, #0x1f00
    str r1, [r2]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov022_021ab9c0
_LIT1: .word data_ov022_021aba08
_LIT2: .word 0x0400006c
_LIT3: .word 0x0400106c
