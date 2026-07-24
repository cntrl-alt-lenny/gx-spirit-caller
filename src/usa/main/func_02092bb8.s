; func_02092bb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a654c
        .extern func_02092280
        .extern func_0209294c
        .extern func_02092960
        .extern func_02092974
        .extern func_02092a60
        .extern OS_SetProtectionRegion1
        .extern OS_SetProtectionRegion2
        .global func_02092bb8
        .arm
func_02092bb8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r0, #0x2
    bl func_02092a60
    mov r1, r0
    mov r0, #0x2
    bl func_02092960
    mov r0, #0x2
    bl func_02092974
    mov r1, r0
    mov r0, #0x2
    bl func_0209294c
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_58
    bl func_02092280
    and r0, r0, #0x3
    cmp r0, #0x1
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
.L_58:
    ldr r0, _LIT1
    bl OS_SetProtectionRegion1
    ldr r0, _LIT2
    bl OS_SetProtectionRegion2
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a654c
_LIT1: .word 0x0200002b
_LIT2: .word 0x023e0021
