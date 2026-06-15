; func_02060958 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021013b4
        .extern data_021013b8
        .extern data_021013bc
        .extern data_021013c0
        .extern data_021013c8
        .extern data_021013d0
        .extern data_021013d8
        .extern func_02060604
        .extern func_02060b84
        .extern func_02060c9c
        .extern func_020ab0c4
        .extern func_020ace00
        .global func_02060958
        .arm
func_02060958:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r4, r0
    bl func_02060c9c
    bl func_020ace00
    mov r7, r0
    ldr r1, _LIT1
    mov r0, r4
    bl func_02060c9c
    bl func_020ace00
    mov r6, r0
    ldr r1, _LIT2
    mov r0, r4
    bl func_02060c9c
    bl func_020ace00
    mov r5, r0
    ldr r1, _LIT3
    mov r0, r4
    bl func_02060c9c
    bl func_020ace00
    mov r2, r5
    mov r5, r0
    mov r1, r6
    mov r0, #0x1
    bl func_02060b84
    mov r8, r0
    mvn r0, #0x0
    cmp r8, r0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT4
    mov r0, r4
    bl func_02060c9c
    bl func_020ace00
    mov r6, r0
    ldr r1, _LIT5
    mov r0, r4
    bl func_020ab0c4
    cmp r0, #0x0
    ldreq r3, _LIT6
    moveq r6, #0x0
    addne r3, r0, #0x6
    mov r0, r8
    mov r1, r7
    mov r2, r5
    str r6, [sp]
    bl func_02060604
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_021013c0
_LIT1: .word data_021013b8
_LIT2: .word data_021013b4
_LIT3: .word data_021013bc
_LIT4: .word data_021013c8
_LIT5: .word data_021013d0
_LIT6: .word data_021013d8
