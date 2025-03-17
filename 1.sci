N=10; p=0.5;
k=0:N;
P=0.5;
P=factorial(N)./(factorial(k).*factorial(N-k)).*(p^k).*((1-p).^(N-k));
plot(k,P,'bO-');
xlabel('Number of Heads(K)');
ylabel('Probability P(k)');
title('Probability of Macrostates in a Coin Tossing Experiment')
