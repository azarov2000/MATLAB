function Moving_the_center(t,Z0,TN,tNS,disp,angle,N)
    

tN=t/TN;    % переходим от безразмерного времени к количеству оборотов
I=find(tN>(tN(end)-tNS)); % вытаскиваем индексы последних оборотов

% Графики перемещений и углов поворота
figure('WindowState','maximized');
    subplot(221);hold on;box on; grid on;
    plot(tN,Z0(:,disp(1)),tN,Z0(:,disp(2)))
    
    legend('\xi_{ x}','\xi_{ y}','FontName','Times New Roman','FontSize',20)
    xlabel('Количество оборотов','FontName','Times New Roman','FontSize',16)
    title(['N = ',num2str(N)]);
    ax2 = gca;
    ax2.FontName = 'Times New Roman';
    ax2.FontSize = 20;
    ylim('padded')
    
    subplot(222);hold on;box on
    plot(tN,Z0(:,angle(1)),tN,Z0(:,angle(2)))
    legend('\vartheta_{ x}','\vartheta_{ y}','FontName','Times New Roman','FontSize',16)
    xlabel('Количество оборотов','FontName','Times New Roman','FontSize',16)
    title(['N = ',num2str(N)]);
    grid on;
    ax2 = gca; 
    ax2.FontName = 'Times New Roman';
    ax2.FontSize = 20;
    ylim('padded')
    
    
    subplot(223);hold on;box on
    plot(tN(I),Z0(I,disp(1)),tN(I),Z0(I,disp(2)))
    
    legend('\xi_{ x}','\xi_{ y}','FontName','Times New Roman','FontSize',20)
    xlabel('Количество оборотов','FontName','Times New Roman','FontSize',16)
    title(['N = ',num2str(N),'; Количество последних оборотов: ',num2str(tNS)]);
    ax2 = gca;
    grid on;
    ax2.FontName = 'Times New Roman';
    ax2.FontSize = 20;
    ylim('padded')
    
    subplot(224);hold on;box on
    plot(tN(I),Z0(I,angle(1)),tN(I),Z0(I,angle(2)))
    legend('\vartheta_{ x}','\vartheta_{ y}','FontName','Times New Roman','FontSize',16)
    xlabel('Количество оборотов','FontName','Times New Roman','FontSize',16)
    title(['N = ',num2str(N),'; Количество последних оборотов: ',num2str(tNS)]);
    grid on;
    ax2 = gca; 
    ax2.FontName = 'Times New Roman';
    ax2.FontSize = 20;
    ylim('padded')
    
end