
                self.candles_pump_10_0 = []
                self.candles_pump_High_10_0 = []
                self.candles_pump_9_0 = []
                self.candles_pump_High_9_0 = []
                self.candles_pump_8_0 = []
                self.candles_pump_High_8_0 = []
                self.candles_pump_High_7_0 = []
                self.candles_pump_7_0 = []
                self.candles_pump_High_6_0 = []
                self.candles_pump_6_0 = []
                self.candles_pump_5_0 = []
                self.candles_pump_High_5_0 = []
                self.procent_ratio_14 = []
                self.procent_pump_14 = []
                self.rq = []
                self.rsi = self.I(get_RSI,self.data.df,plot=True)
                self.stohastic = self.I(get_adxrsistochasic,self.data.df,plot=True)
                self.atr = self.I(get_ATR,self.data.df,plot=False)
                self.HiHok = HIHOK

            
            def next(self):
                if len(self.data.High) >=3:
                    if self.data.High[-1] < self.data.High[-2] > self.data.High[-3]:
                        self.Hihok.append(self.data.High[-2])

                if len(self.data.Low) >=3:
                    if self.data.Low[-1] > self.data.Low[-2] < self.data.Low[-3]:
                        self.Lowiok.append(self.data.Low[-2])
                if len(self.data.Volume) >= 21:
                    procent_pump_13 = ((self.data.Close[-1] - self.data.Close[-13]) / self.data.Close[-13]) * 100
                    procent_pump_volume_13 = sum(self.data.Volume[-13:]) / 13
                if len(self.data.Volume) >= 70:
                    procent_volume_13 = sum(self.data.Volume[-63:-13]) / 49
                    
                    procent_ratio_13 = procent_pump_volume_13 / procent_volume_13

                    
                    

                try:
                    if len(self.data.Close) >= 13:
                        if (self.data.Close[-13] < self.data.Close[-12] and self.data.Close[-12] < self.data.Close[-11] and self.data.Close[-11] < self.data.Close[-10] and self.data.Close[-10] < self.data.Close[-9] and self.data.Close[-9] < self.data.Close[-8] and self.data.Close[-8] < self.data.Close[-7] and self.data.Close[-7] < self.data.Close[-6] and self.data.Close[-6] < self.data.Close[-5] and self.data.Close[-5] < self.data.Close[-4] and self.data.Close[-4] < self.data.Close[-3] and self.data.Close[-3] < self.data.Close[-2] and self.data.Close[-2] < self.data.Close[-1] and procent_pump_13 >= 5.0 and procent_ratio_13 >= 5.0):
                            self.candles_pump_13.append(self.data.Close[-13:])
                            self.candles_pump_High_13.append(self.data.High[-13:])
                    if len(HIHOK) >= 2 and len(self.candles_pump_High_13) > 0:
                        value = HIHOK.index(self.candles_pump_High_13[-1])
                        value_1 = value + 1
                        self.Hihok_13 = []
                        self.Hihok_13.append(HIHOK[value])


                        self.Hihok_13.append(HIHOK[value_1])
                        # Обработать оно берёт время наугад нужно выбрать диапазон где искать
                        indices = self.data.index[self.data['High'] == self.Hihok_13[0]].tolist()
                        indices_0 = self.data.index[self.data['High'] == self.data.High[-1]].tolist()
                        print(indices_0)
                        indices_1 = self.data.index[self.data['High'] == self.Hihok_13[1]].tolist()
                        # print(indices_1)  
                        self.indices_15 = []
                        self.indices_16 = []
                        self.indices_15.append(indices)
                        self.indices_16.append(indices_1)
                        self.indices_1 = []
                        self.indices = []
                        # self.indices.append(indices)
                        # self.indices_1.append(indices_1)
                        self.indices_17 = []  # Инициализируем список для хранения результатов
                        target_element_str = str(self.indices_15)  # Преобразуем Timestamp в строку
                        # Извлечение даты и времени с помощью регулярного выражения
                        matches = re.finditer(r"\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}", target_element_str)

                        self.indices_17 = []

                        for match in matches:
                            target_element_str = match.group()
                            self.indices_17.append(str(target_element_str))

                            # Преобразуйте строку в объект datetime
                            target_element = datetime.strptime(target_element_str, "%Y-%m-%d %H:%M:%S")
                            # print(target_element)

                        target_element_str = str(self.indices_16)  # Преобразуем Timestamp в строку
                        # Извлечение даты и времени с помощью регулярного выражения
                        matches = re.finditer(r"\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}", target_element_str)

                        self.indices_18 = []

                        for match in matches:
                            target_element_str = match.group()
                            self.indices_18.append(str(target_element_str))

                            # Преобразуйте строку в объект datetime
                            target_element = datetime.strptime(target_element_str, "%Y-%m-%d %H:%M:%S")
                            # print(target_element)


                        time_differences = []
                        # Перебор всех комбинаций элементов
                        for idx_17, element_17 in enumerate(self.indices_17):
                            for idx_18, element_18 in enumerate(self.indices_18):
                                time_diff = abs(datetime.strptime(element_17, "%Y-%m-%d %H:%M:%S") - datetime.strptime(element_18, "%Y-%m-%d %H:%M:%S"))
                                time_differences.append((time_diff, idx_17, idx_18))

                        # Найдем пару с наименьшим временным различием
                        if time_differences:
                            # print(time_differences)
                            min_time_difference, min_indices_17, min_indices_18 = min(time_differences, key=lambda x: x[0])
                            self.indices.append(self.indices_17[min_indices_17])
                            self.indices_1.append(self.indices_18[min_indices_18])
                    def find_element_in_column(file_path, column_index, target_element):
                        found_rows = []
                        with open(file_path, newline='') as csvfile:
                            reader = csv.reader(csvfile)
                            for row in reader:
                                if len(row) > column_index:
                                    try:
                                        element = datetime.strptime(row[column_index], "%Y-%m-%d %H:%M:%S")
                                        if element == target_element:  # Сравниваем значение с целевым элементом
                                            found_rows.append(row)
                                    except ValueError:
                                        pass  # Пропускаем строки, в которых не удается преобразовать значение в datetime
                        return found_rows

                    file_path = f'F:\счіфві\{symbol}_5m_31-01-2024_02-01-2024.csv'  # Замените на путь к вашему CSV файлу
                    column_index = 0  # Индекс колонки, в которой вы хотите искать элемент (нумерация с 0)

                    # Пример строки
                    if len(self.indices) > 0:
                        a = -(len(self.indices))
                        print(2141234224244)
                        target_element_str = str(self.indices[-1])  # Преобразуем Timestamp в строку

                        # Извлечение даты и времени с помощью регулярного выражения
                        match = re.search(r"\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}", target_element_str)
                        if match:
                            target_element_str = match.group()
                            self.indices_3 = []
                            self.indices_3.append(str(target_element_str))

                        # Преобразуйте строку в объект datetime
                        target_element = datetime.strptime(target_element_str, "%Y-%m-%d %H:%M:%S")
                        

                        found_rows = find_element_in_column(file_path, column_index, target_element)
                        if found_rows:
                            print("Найденные строки:")
                            for row in found_rows:
                                print(row[2])
                        else:
                            print("Элемент не найден в заданной колонке.")
                    if  len(self.indices_1) > 0:
                        
                        target_element_str = str(self.indices_1)  # Преобразуем Timestamp в строку

                        # Извлечение даты и времени с помощью регулярного выражения
                        match = re.search(r"\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}", target_element_str)
                        if match:
                            target_element_str = match.group()
                            self.indices_4 = []
                            self.indices_4.append(str(target_element_str))
                        # Преобразуйте строку в объект datetime
                        target_element = datetime.strptime(target_element_str, "%Y-%m-%d %H:%M:%S")

                        found_rows = find_element_in_column(file_path, column_index, target_element)
                        qo = 0
                        while qo == 0:
                            if found_rows:
                                # print("Найденные строки:")
                                i = 0
                                while i == 0:
                                    for row in found_rows:
                                        # print(row[2])
                                        # print('gegergwer')
                                        self.price_1 = []
                                        # print(len(self.price_1))
                                        if len(self.price_1) == 0:
                                            self.price_1.append(row[2])
                                            # print(self.price_1)
                                            # print(self.price_1)
                                            # print(self.price_1)
                                            # print(self.price_1)
                                            # print(self.price_1)
                                            i +=1
                                        print('rwerer')
                            qo +=1
                                
                                
                        else:
                            print("Элемент не найден в заданной колонке.")
                        # Загрузка данных из CSV файла в DataFrame
                        df = pd.read_csv(f'F:\счіфві\{symbol}_5m_31-01-2024_02-01-2024.csv')
                        print(symbol)

                        # Заданная цена
                        if len(self.price_1) > 0:
                            print('rwer')
                            print('qw')
                            target_price = float(self.price_1[-1])  # Замените на нужную вам цену
                            
                            
                            # Выбор значений времени, у которых цена во второй колонке равна заданной цене
                            matching_times = df.loc[df.iloc[:, 2] == target_price, df.columns[0]]
                            matching_times_list = matching_times.to_list()
                            aq = len(matching_times_list)   
                            last_element = matching_times_list[-1] if len(matching_times_list) == aq else None
                            self.indices_2 = []
                            if len(self.indices_2) == 0:
                                print('rtretrt')
                                self.indices_2.append(last_element)
                            print(self.indices_3)
                            print(self.indices_2)
                            print('/q')
                            if len(self.indices_3) > 0 and len(self.indices_2) > 0:
                                result_str_1 = ', '.join(str(elem) for elem in self.indices_2)
                                result_str_2 = ', '.join(str(elem) for elem in self.indices_3)
                                print(result_str_1)
                                print(result_str_2)
                                print('rtretttrqwe')

                                matching_times_1 = df[(df['datetime'] >= result_str_2) & (df['datetime'] <= result_str_1)]
                                min_value = matching_times_1['Low'].min()
                            self.Lowiok_13 = []
                            if len(LOWIOK) >= 2 and len(self.Lowiok_13) == 0:
                                value = LOWIOK.index(min_value)

                                indices = self.data.index[self.data['High'] == self.Hihok_13[0]].tolist()
                                value_1 = value + 1
                                self.Lowiok_13.append(LOWIOK[value])
                                self.Lowiok_13.append(LOWIOK[value_1])
                                target_price = float(self.Lowiok_13[1])
                                print(self.data.index[self.data['Low'] == target_price])
                                if self.data.High[-1] == self.Hihok_13[-1]:
                                    matching_times_2 = df.loc[(df.iloc[:, 2] == self.Hihok_13[-1]) & (df['datetime'] >= result_str_1) , df.columns[0]]
                                    print(matching_times_2)
                                    matching_times_list_2 = matching_times_2.to_list()
                                    if len(matching_times_list_2) > 0:
                                        self.rq.append(1)
                                    if matching_times_list_2:
                                        last_element_2 = matching_times_list_2[-1]
                                        self.indices_5 = []
                                        if len(self.indices_5) == 0:
                                            print('retret')
                                            self.indices_5.append(last_element_2)
                                            indices_5_0 = ', '.join(str(elem) for elem in self.indices_5)
                                            indices_3_0 = ', '.join(str(elem) for elem in self.indices_3)
                                            indices_5 = datetime.strptime(indices_5_0, '%Y-%m-%d %H:%M:%S')
                                            indices_3 = datetime.strptime(indices_3_0, '%Y-%m-%d %H:%M:%S')
                                            # print(indices_5)
                                            # print(indices_3)
                                            rozno = int((indices_5 - indices_3).total_seconds() / 300)  
                                            self.rozno = []
                                            self.rozno.append(rozno)


                        if len(self.data.Close) >= 20 and len(self.rozno) > 0:
                            rozno_1 = int(self.rozno[-1])
                            print(rozno_1)
                            if len(self.data.Volume) >= 21:
                                procent_pump_13_0 = ((self.data.Close[-rozno_1] - self.data.Close[-13-rozno_1]) / self.data.Close[-13-rozno_1]) * 100
                                procent_pump_volume_13_0 = sum(self.data.Volume[-13-rozno_1:-rozno_1]) / 13
                            if len(self.data.Volume) >= 70:
                                procent_volume_13_0 = sum(self.data.Volume[-63-rozno_1:-13-rozno_1]) / 49
                                procent_ratio_13_0 = procent_pump_volume_13_0 / procent_volume_13_0


                            if (self.data.Close[-13-rozno_1] < self.data.Close[-12-rozno_1] and self.data.Close[-12-rozno_1] < self.data.Close[-11-rozno_1] and self.data.Close[-11-rozno_1] < self.data.Close[-10-rozno_1] and self.data.Close[-10-rozno_1] < self.data.Close[-9-rozno_1] and self.data.Close[-9-rozno_1] < self.data.Close[-8-rozno_1] and self.data.Close[-8-rozno_1] < self.data.Close[-7-rozno_1] and self.data.Close[-7-rozno_1] < self.data.Close[-6-rozno_1] and self.data.Close[-6-rozno_1] < self.data.Close[-5-rozno_1] and self.data.Close[-5-rozno_1] < self.data.Close[-4-rozno_1] and self.data.Close[-4-rozno_1] < self.data.Close[-3-rozno_1] and self.data.Close[-3-rozno_1] < self.data.Close[-2-rozno_1] and self.data.Close[-2-rozno_1] < self.data.Close[-1-rozno_1] and procent_pump_13_0 >= 5.0 and procent_ratio_13_0 >= 5.0):
                                self.candles_pump_13_0.append(self.data.Close[-13-rozno_1:-rozno_1])
                                self.candles_pump_High_13_0.append(self.data.High[-13-rozno_1:-rozno_1])
                        
                        if not self.position and self.balance > 0:
                            if self.Lowiok_13:
                                self.data.Low[-1] == self.Lowiok_13[-1]

                                if len(self.Hihok_13) >=2:
                                    print(1111111)

                                    if len(self.candles_pump_High_13_0) >=1:
                                        a = self.candles_pump_High_13_0[-1]
                                        b = a[-1]
                                        print(b)


                                        print(self.Hihok_13[-2])
                                        if self.Hihok_13[-2] == b:
                                            print(self.Lowiok_13[-1])

                                            print('trettrttetr')
                                            print('trettrttetr')
 
                                            if self.Hihok_13[-1] > self.Lowiok_13[-2] and self.Hihok_13[-2] < self.Hihok_13[-1]:
                                                if self.data.High[-1] > self.Hihok_13[-1]:
                                                    print(self.data.High[-1])
                                                    print(435435435)

                                                    sl1 = (self.atr[-1] * 2)
                                                    tp1 = (self.atr[-1] * 8)
                                                    sl = self.data.Close[-1] - sl1
                                                    tp = self.data.Close[-1] + tp1  
                                                    kef1 = ((self.data.Close[-1]-sl)/self.data.Close[-1]) * 100
                                                    kef2 = ((self.equity/50)/kef1)*100
                                                    kef3 = kef2/self.equity
                                                    position_size = self.equity * kef3
                                                    qty = int(position_size / self.data.Close[-1])
                                                    if qty > 0 and position_size > 0:
                                                        self.candles_pump_13 = []
                                                        self.buy(tp=tp, sl=sl, size=qty)
                                                        self.candles_pump_13 = []
                                                        self.candles_pump_High_13 = []
                                                        self.candles_pump_13_0 = []
                                                        self.candles_pump_High_13_0 = []
                                                        self.list1 = []
                                                        self.Hihok_13 = []
                                                        self.Lowiok_13 = []
                                                        self.value_13 = []
                                                        self.indices = []
                                                        self.indices_1 = []
                                                        self.indices_2 = []
                                                        self.indices_3 = []
                                                        self.indices_4 = []
                                                        self.indices_5 = []
                                                        self.indices_6 = []
                                                        self.price_0 = []
                                                        self.price_1 = []
                                                        self.price_2 = []
                                                        self.rozno = []
                except:
                        self.candles_pump_13 = []
                        self.candles_pump_High_13 = []
                        self.candles_pump_13_0 = []
                        self.candles_pump_High_13_0 = []
                        self.list1 = []
                        self.Hihok_13 = []
                        self.Lowiok_13 = []
                        self.value_13 = []
                        self.indices = []
                        self.indices_1 = []
                        self.indices_2 = []
                        self.indices_3 = []
                        self.indices_4 = []
                        self.indices_5 = []
                        self.indices_6 = []
                        self.price_0 = []
                        self.price_1 = []
                        self.price_2 = []
                        self.rozno = []



                


                                    
                

        bt = Backtest(
            ohlc_df,
            test_123bar,
            cash=300000,
            margin=1/100  ,
            commission=0.001,
            # exclusive_orders=True,
            # hedging=True,
        )
        stats = bt.run()
        statistic = stats["_trades"]
        print(stats)
        bad_statistic = statistic[statistic["PnL"] < 0]
        print(bad_statistic)
        # bt.plot()
        return (sym, stats["Equity Final [$]"])

    except TypeError as e:
        print(f"Ошибка при выполнении бэктеста для символа {sym}: {e}")
        return sym

if __name__ == "__main__":

    pool = Pool(processes=12)

    symbols = ['DOGEUSDT']
    results = pool.map(run_backtest, symbols)
    errors = []  # Список для сохранения тикеров с ошибками
    resultsй = []
    for symbol in symbols:
        res = run_backtest(symbol)
        resultsй.append(res)
    # Находим тикер с наибольшим Equity Final
    best_ticker = max(resultsй, key=lambda x: x[1])[0]
    print(
        f"Наилучший тикер: {best_ticker}, Equity Peak [$] {max([i[1] for i in resultsй])}"
    )
    for result in results:
        if result is not None and isinstance(result, str):
            errors.append(result)  # Добавляем тикеры с ошибками в список

    print("Тикеры, вызвавшие ошибки:")
    print(errors)
    pool.close()
    pool.join()
    print(
        f"Наилучший тикер: {best_ticker}, Equity Peak [$] {max([i[1] for i in results])}"
    )
