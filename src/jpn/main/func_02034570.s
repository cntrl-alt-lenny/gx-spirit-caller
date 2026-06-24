; func_02034570 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02031e58
        .extern func_02032020
        .extern func_020322fc
        .extern func_0203231c
        .extern func_02032638
        .extern func_02032f3c
        .extern func_02032f58
        .extern func_02032fac
        .extern func_02032fe4
        .extern func_02034124
        .extern func_02034160
        .extern func_020341e8
        .extern func_02034220
        .extern func_020342d0
        .extern func_020343fc
        .extern func_0203454c
        .extern func_0203455c
        .extern func_02034704
        .extern func_02093b08
        .global func_02034570
        .arm
func_02034570:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02034124
    mov r1, #0x0
    str r1, [r4, #0x30]
    str r1, [r4, #0x34]
    str r1, [r4, #0x3c]
    mov r0, r4
    str r1, [r4, #0x38]
    bl func_020343fc
    cmp r0, #0x0
    bge .L_3c
    bl func_02093b08
    mvn r0, #0x0
    ldmia sp!, {r4, pc}
.L_3c:
    bl func_020322fc
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r3, #0x800
    bl func_0203231c
    bl func_02031e58
    ldr r1, _LIT0
    ldr r2, _LIT1
    bl func_02032020
    bl func_02032638
    ldr r1, _LIT2
    bl func_02032fe4
    bl func_02032638
    ldr r1, _LIT3
    bl func_02032f3c
    bl func_02032638
    ldr r1, _LIT4
    bl func_02032fac
    bl func_02032638
    ldr r1, _LIT5
    bl func_02032f58
    add r0, r4, #0x40
    mov r1, #0x400
    bl func_02034704
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word func_0203454c
_LIT1: .word func_0203455c
_LIT2: .word func_02034160
_LIT3: .word func_020341e8
_LIT4: .word func_02034220
_LIT5: .word func_020342d0
