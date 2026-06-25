; func_020037b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102b9c
        .extern func_02001ef8
        .global func_020037b0
        .arm
func_020037b0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    ldr ip, [sp, #0x1c]
    sub ip, ip, #0x8
    cmp ip, #0x8
    addls pc, pc, ip, lsl #0x2
    b .L_1970
    b .L_18f8
    b .L_1970
    b .L_1910
    b .L_1970
    b .L_1928
    b .L_1970
    b .L_1940
    b .L_1970
    b .L_1958
.L_18f8:
    ldr lr, _LIT0
    mov ip, #0x20
    ldr lr, [lr, #0x88]
    mov r4, #0x4
    add r5, lr, #0x80
    b .L_1978
.L_1910:
    ldr lr, _LIT0
    mov ip, #0x32
    ldr lr, [lr, #0x90]
    mov r4, #0x5
    add r5, lr, #0x80
    b .L_1978
.L_1928:
    ldr lr, _LIT0
    mov ip, #0x48
    ldr lr, [lr, #0x98]
    mov r4, #0x6
    add r5, lr, #0x80
    b .L_1978
.L_1940:
    ldr lr, _LIT0
    mov ip, #0x62
    ldr lr, [lr, #0xa0]
    mov r4, #0x7
    add r5, lr, #0x80
    b .L_1978
.L_1958:
    ldr lr, _LIT0
    mov ip, #0x80
    ldr lr, [lr, #0xa8]
    mov r4, #0x8
    add r5, lr, #0x80
    b .L_1978
.L_1970:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_1978:
    ldr lr, [r0]
    mla r0, ip, r1, r5
    str lr, [sp]
    str r2, [sp, #0x4]
    mov r1, r3
    ldr r2, [sp, #0x18]
    ldr r3, [sp, #0x1c]
    str r4, [sp, #0x8]
    bl func_02001ef8
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02102b9c
