        .text
        .extern func_ov002_0226acf8
        .global func_ov002_0226b11c
        .arm
func_ov002_0226b11c:
    ldr ip, .L_0226b138
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    rsb r0, r0, #0x1
    mov r1, #0xb
    mov r3, #0x0
    bx ip
.L_0226b138: .word func_ov002_0226acf8
