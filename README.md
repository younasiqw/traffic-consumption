# VPS數據流量消耗shell

這個shell腳本可以幫助你快速消耗VPS的數據流量。

## 如何使用

1. 下載腳本

   ```
   curl -O https://raw.githubusercontent.com/younasiqw/traffic-consumption/main/datafk.sh
   ```

2. 給腳本添加執行權限

   ```
   chmod +x datafk.sh
   ```

3. 執行腳本

   ```
   ./datafk.sh
   ```

   或者使用以下命令直接運行：

   ```
   bash <(curl -fsSL https://raw.githubusercontent.com/younasiqw/traffic-consumption/main/datafk.sh)
   ```

## 注意事項

- 本腳本僅適用於Linux系統。
- 本腳本需要root權限運行。
- 本腳本需要curl和mailx命令支持，如果你的系統中沒有這些命令，請先安裝。
- 本腳本僅支持消耗單一網卡的數據流量，如果你的VPS有多個網卡，請自行修改腳本。
