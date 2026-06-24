; func_02088f84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a5720
        .extern func_02097db0
        .extern func_02097e1c
        .global func_02088f84
        .arm
func_02088f84:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, _LIT0
    mov r5, r2
    ldr r4, [r4]
    mov r6, r1
    ldr r2, [r4, #0x84]
    ldr r1, [r2, #0x8]
    cmp r0, r1
    mvncs r0, #0x0
    ldmcsia sp!, {r4, r5, r6, pc}
    add r1, r2, #0xc
    add r1, r1, r0, lsl #0x4
    ldr r0, [r1, #0x4]
    ldr r1, [r1]
    sub r0, r0, r3
    cmp r5, r0
    movhi r5, r0
    add r0, r4, #0x34
    add r1, r1, r3
    mov r2, #0x0
    bl func_02097db0
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, r6
    mov r2, r5
    add r0, r4, #0x34
    bl func_02097e1c
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021a5720
