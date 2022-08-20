target("mutlimedia")  -- 设置目标程序名字
    set_kind("binary")   -- 设置编译成二进制程序，不设置默认编译成二进制程序，可选择编译成动静态库等
    
    -- 设置交叉编译工具链头文件目录
    add_includedirs("/usr/local/arm_gcc/gcc-linaro-4.9.4-2017.01-i686_arm-linux-gnueabihf/arm-linux-gnueabihf/libc/usr/include")   
    
    -- 设置链接库搜索路径
    add_linkdirs("/opt/tslib-1.21/lib")  
    add_linkdirs("/usr/local/arm_gcc/gcc-linaro-4.9.4-2017.01-i686_arm-linux-gnueabihf/arm-linux-gnueabihf/libc/usr/lib")
    -- 设置链接的库
    add_links("m", "pthread", "ts");

    stdc = "c99"
    set_languages(stdc, "c++11")

    add_files("./*.c")  

    local src_path = {
        "lvgl/src/",
        "lvgl/demos/",
        "lv_drivers/"
    }

    for _, index in ipairs(src_path) do
        for _, dir in ipairs(os.dirs(index.."/**")) do
            add_files(dir.."/*.c");    
            add_includedirs(dir);
        end
    end

    -- -- 递归遍历获取所有子目录
    -- for _, dir in ipairs(os.dirs("lvgl/src/**")) do
    --     add_files(dir.."/*.c");    
    --     add_includedirs(dir);
    -- end

    -- -- 递归遍历获取所有子目录
    -- for _, dir in ipairs(os.dirs("lvgl/demos/**")) do
    --     add_files(dir.."/*.c");   -- 添加目录下所有C文件
    --     add_includedirs(dir);  -- 添加目录作为头文件搜索路径
    -- end

    -- for _, v in ipairs(os.dirs("lv_drivers/**")) do
    --     add_files(v.."/*.c");
    --     add_includedirs(v);
    -- end

    add_includedirs(".")   
    add_includedirs("/opt/tslib-1.21/include")  
