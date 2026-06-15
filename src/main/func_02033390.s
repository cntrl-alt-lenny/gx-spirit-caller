; func_02033390 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032888
        .extern func_02032a34
        .extern func_02032c44
        .extern func_02032cc8
        .extern func_02032cfc
        .extern func_02032d2c
        .extern func_02046c60
        .extern func_0204706c
        .extern func_0204757c
        .extern func_020526b8
        .extern func_02052798
        .extern func_020527b8
        .extern func_020527d8
        .extern func_020527f8
        .global func_02033390
        .arm
func_02033390:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r5, r0
    ldr r1, [r5, #0xe94]
    add r0, r5, #0x1fc
    str r1, [sp]
    ldr r1, [r5, #0xe98]
    add r4, r0, #0xc00
    str r1, [sp, #0x4]
    ldr r1, [r5, #0xe9c]
    add r0, r5, #0x4
    str r1, [sp, #0x8]
    ldr r2, [r4, #0x80]
    add r1, r4, #0x40
    str r2, [sp, #0xc]
    ldr r2, [r5, #0xeac]
    str r2, [sp, #0x10]
    ldr r2, [r5, #0xe8c]
    ldr r3, [r5, #0xe90]
    bl func_0204757c
    ldr r0, _LIT0
    mov r1, r5
    bl func_02046c60
    ldr r0, _LIT1
    bl func_020527d8
    ldr r0, _LIT2
    bl func_020527b8
    ldr r0, [r5, #0xea0]
    mov r7, #0x0
    cmp r0, #0x0
    ble .L_9c
    mov r6, r7
.L_80:
    mov r1, r6
    and r0, r7, #0xff
    bl func_020526b8
    ldr r0, [r5, #0xea0]
    add r7, r7, #0x1
    cmp r7, r0
    blt .L_80
.L_9c:
    ldr r0, _LIT3
    bl func_020527f8
    ldr r0, _LIT4
    bl func_02052798
    ldr r0, [r5, #0xeb4]
    ldr r2, _LIT5
    bic r0, r0, #0x100
    mov r3, r5
    str r0, [r5, #0xeb4]
    add r0, r4, #0xc
    mov r1, #0x0
    bl func_0204706c
    ldr r1, [r5, #0xeb4]
    orr r1, r1, #0x1
    str r1, [r5, #0xeb4]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word func_02032888
_LIT1: .word func_02032cc8
_LIT2: .word func_02032cfc
_LIT3: .word func_02032d2c
_LIT4: .word func_02032c44
_LIT5: .word func_02032a34
