; func_020345c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02031eac
        .extern func_02032074
        .extern func_02032350
        .extern func_02032370
        .extern func_0203268c
        .extern func_02032f90
        .extern func_02032fac
        .extern func_02033000
        .extern func_02033038
        .extern func_02034174
        .extern func_020341b0
        .extern func_02034238
        .extern func_02034270
        .extern func_02034320
        .extern func_0203444c
        .extern func_0203459c
        .extern func_020345ac
        .extern func_02034754
        .extern func_02093bfc
        .global func_020345c0
        .arm
func_020345c0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02034174
    mov r1, #0x0
    str r1, [r4, #0x30]
    str r1, [r4, #0x34]
    str r1, [r4, #0x3c]
    mov r0, r4
    str r1, [r4, #0x38]
    bl func_0203444c
    cmp r0, #0x0
    bge .L_3c
    bl func_02093bfc
    mvn r0, #0x0
    ldmia sp!, {r4, pc}
.L_3c:
    bl func_02032350
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r3, #0x800
    bl func_02032370
    bl func_02031eac
    ldr r1, _LIT0
    ldr r2, _LIT1
    bl func_02032074
    bl func_0203268c
    ldr r1, _LIT2
    bl func_02033038
    bl func_0203268c
    ldr r1, _LIT3
    bl func_02032f90
    bl func_0203268c
    ldr r1, _LIT4
    bl func_02033000
    bl func_0203268c
    ldr r1, _LIT5
    bl func_02032fac
    add r0, r4, #0x40
    mov r1, #0x400
    bl func_02034754
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word func_0203459c
_LIT1: .word func_020345ac
_LIT2: .word func_020341b0
_LIT3: .word func_02034238
_LIT4: .word func_02034270
_LIT5: .word func_02034320
