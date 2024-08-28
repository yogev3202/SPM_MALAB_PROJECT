for k = 1:12
    sp(k) = subplot(3,4,k);
    plot(peaks)
    title(['Title plot ',num2str(k)])
end
spPos = cat(1,sp([1 3]).Position);
titleSettings = {'HorizontalAlignment','center','EdgeColor','none','FontSize',18};
annotation('textbox','Position',[spPos(1,1:2) 0.3 0.3],'String','Left title',titleSettings{:})
annotation('textbox','Position',[spPos(2,1:2) 0.3 0.3],'String','Right title',titleSettings{:})